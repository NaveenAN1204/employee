<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            height: 100vh;
            background-color: #f0f2f5;
        }

        .sidebar {
            width: 200px;
            background: #4e73df;
            color: white;
            height: 100vh;
            display: flex;
            flex-direction: column;
            padding-top: 2em;
        }

        .sidebar h2 {
            text-align: center;
            margin: 0;
            margin-bottom: 1em;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            margin: 0.5em 1em;
            padding: 0.5em;
            display: block;
        }

        .sidebar a:hover {
            background: #2e59d9;
            border-radius: 4px;
        }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background: #ffffff;
            color: #333;
            padding: 1em;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
        }

        .navbar .search-bar {
            flex: 1;
            margin-left: 1em;
        }

        .navbar input[type="text"] {
            width: 100%;
            padding: 0.5em;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .navbar .user-info {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .navbar .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-left: 1em;
        }

        .container {
            flex: 1;
            padding: 1em;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1em;
            
        }

        .card {
            background: white;
            padding: 1em;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .chart {
            background: white;
            padding: 1em;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            height: 400px;
        }
        

        .chart canvas {
            width: 100%;
            height: 100%;
        }

        /* Submenu styling */
        .sub-menu {
            position: absolute;
            top: 60px;
            right: 10px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: none;
            flex-direction: column;
        }

        .sub-menu.open-menu {
            display: flex;
        }

        .sub-menu-link {
            padding: 1em;
            display: flex;
            justify-content: space-between;
            align-items: center;
            text-decoration: none;
            color: #333;
            border-bottom: 1px solid #ddd;
        }

        .sub-menu-link:last-child {
            border-bottom: none;
        }

        .sub-menu-link:hover {
            background: #f0f2f5;
        }

        .sub-menu-link button {
            background: none;
            border: none;
            color: #333;
            cursor: pointer;
            padding: 0;
            font: inherit;
        }

        /* Nested settings submenu styling */
        .nested-sub-menu {
            display: none;
            flex-direction: column;
        }

        .nested-sub-menu-link {
            padding: 1em;
            display: flex;
            justify-content: space-between;
            align-items: center;
            text-decoration: none;
            color: #333;
            border-bottom: 1px solid #ddd;
            padding-left: 2em;
        }

        .nested-sub-menu-link:last-child {
            border-bottom: none;
        }

        .nested-sub-menu-link:hover {
            background: #f0f2f5;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>MY ACCOUNT</h2>
        <a href="#">Dashboard</a>
        <a href="#">Components</a>
        <a href="#">Utilities</a>
        <a href="#">Pages</a>
        <a href="#">Charts</a>
        <a href="#">Tables</a>
    </div>
    <div class="main-content">
        <div class="navbar">
            <div>Dashboard</div>
            <div class="search-bar">
                <input type="text" placeholder="Search for...">
            </div>
            <div class="user-info" onclick="toggleMenu()">
                <img src="https://via.placeholder.com/40" alt="User">
                <span>Douglas McGee</span>
            </div>
            <div id="subMenu" class="sub-menu">
                <a href="#" class="sub-menu-link">
                    <p>Edit Profile</p>
                    <span>></span>
                </a>
                <a href="#" class="sub-menu-link" onclick="toggleNestedMenu(event)">
                    <p>Settings & Privacy</p>
                    <span>></span>
                </a>
                <div id="nestedSubMenu" class="nested-sub-menu">
                    <a href="#" class="nested-sub-menu-link">Privacy Settings</a>
                    <a href="#" class="nested-sub-menu-link">Account Settings</a>
                </div>
                <a href="#" class="sub-menu-link">
                    <p>Help & Support</p>
                    <span>></span>
                </a>
                <a href="#" class="sub-menu-link">
                    <form action="logout" method="post">
                        <button type="submit">Logout</button>
                    </form>
                    <span>></span>
                </a>
            </div>
        </div>
        <div class="container">
            <div class="card">
                <h3>Earnings (Monthly)</h3>
                <p>$40,000</p>
            </div>
            <div class="card">
                <h3>Earnings (Annual)</h3>
                <p>$215,000</p>
            </div>
            <div class="card">
                <h3>Tasks</h3>
                <p>50%</p>
            </div>
            <div class="card">
                <h3>Pending Requests</h3>
                <p>18</p>
            </div>
            <div class="chart">
                <h3>Earnings Overview</h3>
                <canvas id="earningsChart"></canvas>
            </div>
            <div class="chart">
                <h3>Revenue Sources</h3>
                <canvas id="revenueChart"></canvas>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        var ctx = document.getElementById('earningsChart').getContext('2d');
        var earningsChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [{
                    label: 'Earnings',
                    data: [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000],
                    borderColor: 'rgba(78, 115, 223, 1)',
                    backgroundColor: 'rgba(78, 115, 223, 0.1)',
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        var ctx2 = document.getElementById('revenueChart').getContext('2d');
        var revenueChart = new Chart(ctx2, {
            type: 'doughnut',
            data: {
                labels: ['Direct', 'Social', 'Referral'],
                datasets: [{
                    data: [55, 30, 15],
                    backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
                }]
            }
        });

        function toggleMenu() {
            var subMenu = document.getElementById('subMenu');
            subMenu.classList.toggle('open-menu');
        }

        function toggleNestedMenu(event) {
            event.preventDefault();
            var nestedSubMenu = document.getElementById('nestedSubMenu');
            nestedSubMenu.style.display = nestedSubMenu.style.display === 'flex' ? 'none' : 'flex';
        }
    </script>
</body>
</html>
    