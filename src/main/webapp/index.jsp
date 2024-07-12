<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter, java.time.Duration" %>
<!DOCTYPE html>
<html>
<head>
    <title>Time Since Birth</title>
    <script>
        function calculateTimeSinceBirth(birthDateTime) {
            if (!birthDateTime) return;

            const birthDate = new Date(birthDateTime);
            setInterval(() => {
                const now = new Date();
                const duration = now - birthDate;

                const years = Math.floor(duration / (1000 * 60 * 60 * 24 * 365));
                const months = Math.floor((duration % (1000 * 60 * 60 * 24 * 365)) / (1000 * 60 * 60 * 24 * 30));
                const days = Math.floor((duration % (1000 * 60 * 60 * 24 * 30)) / (1000 * 60 * 60 * 24));
                const hours = Math.floor((duration % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                const minutes = Math.floor((duration % (1000 * 60 * 60)) / (1000 * 60));
                const seconds = Math.floor((duration % (1000 * 60)) / 1000);

                document.getElementById('timeSinceBirth').innerHTML =
                    years + " years, " +
                    months + " months, " +
                    days + " days, " +
                    hours + " hours, " +
                    minutes + " minutes, " +
                    seconds + " seconds";
            }, 1000);
        }
    </script>
</head>
<body>
    <h1>Time Since Birth</h1>
    <h1><a href="html.html">HOME</a></h1>
    <form method="post" action="index.jsp">
        <label for="dob">Date of Birth (YYYY-MM-DD):</label>
        <input type="date" id="dob" name="dob" required>
        <br>
        <label for="birthTime">Time of Birth (HH:MM):</label>
        <input type="time" id="birthTime" name="birthTime" required>
        <br>
        <input type="submit" value="Calculate">





    </form>

    <h2 id="timeSinceBirth"></h2>

    <%
        String dob = request.getParameter("dob");
        String birthTime = request.getParameter("birthTime");

        if (dob != null && birthTime != null) {
            String birthDateTimeString = dob + "T" + birthTime + ":00";
            LocalDateTime birthDateTime = LocalDateTime.parse(birthDateTimeString);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
            String formattedBirthDateTime = birthDateTime.format(formatter);
    %>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            calculateTimeSinceBirth("<%= formattedBirthDateTime %>");
        });
    </script>
    <%
        } else {
    %>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            calculateTimeSinceBirth(null);
        });
    </script>
    <%
        }
    %>
</body>
</html>
