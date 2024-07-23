<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Task Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color:white;
        }

        .container {
            text-align:left;
            background: white;
            padding: 2em;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);
            width: 300px; 
    </style>
</head>
<body>
    <div class="container">
        <h1>Task Management</h1>
        <form action="TaskServlet" method="post">
            <input type="hidden" name="action" value="add">
            <label for="employeeId">Employee ID:</label>
            <input type="text" id="employeeId" name="employeeId" required><br><br>
            <label for="projectId">Project ID:</label>
            <input type="text" id="projectId" name="projectId" required><br><br>
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required><br><br>
            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" required><br><br>
            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" required><br><br>
            <label for="taskCategory">Task Category:</label>
            <input type="text" id="taskCategory" name="taskCategory" required><br><br>
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea><br><br>
            <input type="submit" value="Add Task">
        </form>
    </div>
</body>
</html>
    