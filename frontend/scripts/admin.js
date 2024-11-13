document.addEventListener("DOMContentLoaded", async function () {
    if (!checkIfAdmin()) {
        window.location.href = "/movie-recommender/frontend/pages/index.html";
        return;
    } else {

        if (!checkUserLoggedIn()) {
            window.location.href = "/movie-recommender/frontend/pages/login.html";
            return;
        }
        await fetchAndDisplayUsers();
    }
});

// Fetch and display users in the table
async function fetchAndDisplayUsers() {
    const users = await fetchAllUsers(); // Fetch all users

    if (users && users.length > 0) {
        const tbody = document.querySelector(".styled-table tbody");
        tbody.innerHTML = ""; // Clear existing rows

        users.forEach(({ username, email, bookmarks = 0, isBanned, user_id }) => {
            const row = document.createElement("tr");

            // Add cells to the row
            row.innerHTML = `
                <td>${username}</td>
                <td>${email}</td>
                <td>${bookmarks}</td>
                <td class="account-message">${isBanned ? "Banned" : "Active"}</td>
                <td class="action-buttons">
                    ${isBanned
                    ? `<button class="unban-btn" onclick="toggleBanStatus(this, ${user_id}, false)">Unban</button>`
                    : `<button class="ban-btn" onclick="toggleBanStatus(this, ${user_id}, true)">Ban</button>`
                }
                </td>
            `;

            tbody.appendChild(row); // Append the row to the table body
        });
    } else {
        console.error("No users found or failed to fetch users.");
    }
}


// Function to toggle ban status and update the table row
async function toggleBanStatus(button, userId, ban) {
    try {
        const result = ban ? await banUser(userId) : await unbanUser(userId); // Call global functions

        if (result && result.success) {
            const row = button.closest("tr");
            const accountMessageCell = row.querySelector(".account-message");
            const actionButtonsCell = row.querySelector(".action-buttons");

            // Update the status and button dynamically
            accountMessageCell.textContent = ban ? "Banned" : "Active";
            actionButtonsCell.innerHTML = ban
                ? `<button class="unban-btn" onclick="toggleBanStatus(this, ${userId}, false)">Unban</button>`
                : `<button class="ban-btn" onclick="toggleBanStatus(this, ${userId}, true)">Ban</button>`;

            console.log(`User ${ban ? "banned" : "unbanned"} successfully.`);
        } else {
            throw new Error(result ? result.message : "Action failed.");
        }
    } catch (error) {
        console.error(`Error ${ban ? "banning" : "unbanning"} user:`, error.message);
    }
}
