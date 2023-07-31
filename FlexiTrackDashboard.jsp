<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>
<script>
    var isReloaded = false;
    function reloadPage() {
        if (!isReloaded) {
            isReloaded = true;
            location.reload();
        }
        
    }
    
</script>
<% 
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection c1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "orcl");
    Statement stmt = c1.createStatement();
    
    ResultSet rs = stmt.executeQuery("select * from FlexiTrackLoginInformation");
    int sundayDataBarHeight = 0;
    int mondayDataBarHeight = 0;
    int tuesdayDataBarHeight = 0;
    int wednesdayDataBarHeight = 0;
    int thursdayDataBarHeight = 0;
    int fridayDataBarHeight = 0;
    int saturdayDataBarHeight = 0;
    while(rs.next()) {
        if (rs.getString("Username").equals("Jotishkumar")) {
            sundayDataBarHeight = (Integer.parseInt(rs.getString("SUNDAYDATA")))/36;
            mondayDataBarHeight = (Integer.parseInt(rs.getString("MONDAYDATA")))/36;
            tuesdayDataBarHeight = (Integer.parseInt(rs.getString("TUESDAYDATA")))/36;
            wednesdayDataBarHeight = (Integer.parseInt(rs.getString("WEDNESDAYDATA")))/36;
            thursdayDataBarHeight = (Integer.parseInt(rs.getString("THURSDAYDATA")))/36;
            fridayDataBarHeight = (Integer.parseInt(rs.getString("FRIDAYDATA")))/36;
            saturdayDataBarHeight = (Integer.parseInt(rs.getString("SATURDAYDATA")))/36;
        }
    }
    
    ResultSet rs2 = stmt.executeQuery("Select * from FlexiTrackLoginInformation");
    String bestday = "";
    String amountOfStepsOnBestDay = "0";
    ArrayList<String> listOfDays = new ArrayList<String>();
    while(rs2.next()) {
        if (rs2.getString("Username").equals("Jotishkumar")) {
            listOfDays.add(rs2.getString("SUNDAYDATA"));
            listOfDays.add(rs2.getString("MONDAYDATA"));
            listOfDays.add(rs2.getString("TUESDAYDATA"));
            listOfDays.add(rs2.getString("WEDNESDAYDATA"));
            listOfDays.add(rs2.getString("THURSDAYDATA"));
            listOfDays.add(rs2.getString("FRIDAYDATA"));
            listOfDays.add(rs2.getString("SATURDAYDATA"));
        }
    }

    ResultSet rs3 = stmt.executeQuery("Select * from FlexiTrackLoginInformation");
    int yourAverage = 0;
    ArrayList<String> daysWithValues = new ArrayList<String>();
    while(rs3.next()) {
        if (rs3.getString("Username").equals("Jotishkumar")) {
            if (rs3.getString("SUNDAYDATA") != "0" ) {
                daysWithValues.add(rs3.getString("SUNDAYDATA"));
            }
            if (rs3.getString("MONDAYDATA") != "0" ) {
                daysWithValues.add(rs3.getString("MONDAYDATA"));
            }
            if (rs3.getString("TUESDAYDATA") != "0" ) {
                daysWithValues.add(rs3.getString("TUESDAYDATA"));
            }
            if (rs3.getString("WEDNESDAYDATA") != "0" ) {
                daysWithValues.add(rs3.getString("WEDNESDAYDATA"));
            }
            if (rs3.getString("THURSDAYDATA") != "0" ) {
                daysWithValues.add(rs3.getString("THURSDAYDATA"));
            }
            if (rs3.getString("FRIDAYDATA") != "0" ) {
                daysWithValues.add(rs3.getString("FRIDAYDATA"));
            }
            if (rs3.getString("SATURDAYDATA") != "0" ) {
                daysWithValues.add(rs3.getString("SATURDAYDATA"));
            }
        }
    }

    int sumOfSteps = 0;
    for (int i=0;i<daysWithValues.size();i++) {
        sumOfSteps += Integer.parseInt(daysWithValues.get(i));
    }
    yourAverage = (sumOfSteps/daysWithValues.size());


    for (int i=0; i<listOfDays.size(); i++) {
        if (Integer.parseInt(amountOfStepsOnBestDay) < Integer.parseInt(listOfDays.get(i))) {
            amountOfStepsOnBestDay = listOfDays.get(i);
        }
    }
    int indexFound = 0;
    for (int j=0; j<listOfDays.size(); j++) {
        if (amountOfStepsOnBestDay == listOfDays.get(j)) {
            indexFound = j;
        }
    }    
    if (indexFound == 0) {
        bestday = "Sunday";
    }
    if (indexFound == 1) {
        bestday = "Monday";
    }
    if (indexFound == 2) {
        bestday = "Tuesday";
    }
    if (indexFound == 3) {
        bestday = "Wednesday";
    }
    if (indexFound == 4) {
        bestday = "Thursday";
    }
    if (indexFound == 5) {
        bestday = "Friday";
    }
    if (indexFound == 6) {
        bestday = "Saturday";
    }
    int sundayDataBarLengthToMoveDown = 280-sundayDataBarHeight;
    int mondayDataBarLengthToMoveDown = 280-mondayDataBarHeight;
    int tuesdayDataBarLengthToMoveDown = 280-tuesdayDataBarHeight;
    int wednesdayDataBarLengthToMoveDown = 280-wednesdayDataBarHeight;
    int thursdayDataBarLengthToMoveDown = 280-thursdayDataBarHeight;
    int fridayDataBarLengthToMoveDown = 280-fridayDataBarHeight;
    int saturdayDataBarLengthToMoveDown = 280-saturdayDataBarHeight;
    c1.close();
    
%>
<html>
    <head>
        <link href="FlexiTrackDashboardCSS.css" rel = "stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
        <style>
            .sunday-data-bar {
                
                position: absolute;
                background-color: black;
                width: 50px;
                height: <%=sundayDataBarHeight%>px;
                left: 50px;
                bottom:0px;
            }
            .monday-data-bar {
                position: absolute;
                background-color: black;
                width: 50px;
                height: <%=mondayDataBarHeight%>px;
                left: 150px;
                bottom:0px;
            }
            .tuesday-data-bar {
                position: absolute;
                background-color: black;
                width: 50px;
                height: <%=tuesdayDataBarHeight%>px;
                left: 250px;
                bottom:0px;
            }
            .wednesday-data-bar {
                position: absolute;
                background-color: black;
                width: 50px;
                height: <%=wednesdayDataBarHeight%>px;
                left: 350px;
                bottom:0px;
            }
            .thursday-data-bar {
                position: absolute;
                background-color: black;
                width: 50px;
                height: <%=thursdayDataBarHeight%>px;
                left: 450px;
                bottom:0px;
            }
            .friday-data-bar {
                position: absolute;
                background-color: black;
                width: 50px;
                height: <%=fridayDataBarHeight%>px;
                left: 550px;
                bottom:0px;
            }
            .saturday-data-bar {
                position: absolute;
                background-color: black;
                width: 50px;
                height: <%=saturdayDataBarHeight%>px;
                left: 650px;
                bottom:0px;
            }
            #sunday-bar-label {
                font-family:'Roboto', sans-serif;
                position: absolute;
                font-size: 20px;
                top: 305px;
                left: 140px;
            }
            #monday-bar-label {
                font-family:'Roboto', sans-serif;
                position: absolute;
                font-size: 20px;
                top: 305px;
                left: 240px;
            }
            #tuesday-bar-label {
                font-family:'Roboto', sans-serif;
                position: absolute;
                font-size: 20px;
                top: 305px;
                left: 340px;
            }
            #wednesday-bar-label {
                font-family:'Roboto', sans-serif;
                position: absolute;
                font-size: 20px;
                top: 305px;
                left: 440px;
            }
            #thursday-bar-label {
                font-family:'Roboto', sans-serif;
                position: absolute;
                font-size: 20px;
                top: 305px;
                left: 540px;
            }
            #friday-bar-label {
                font-family:'Roboto', sans-serif;
                position: absolute;
                font-size: 20px;
                top: 305px;
                left: 640px;
            }
            #saturday-bar-label {
                font-family:'Roboto', sans-serif;
                position: absolute;
                font-size: 20px;
                top: 305px;
                left: 740px;
            }
            .lower-left-bubble {
                background-color: rgb(240, 240, 240);
                position:fixed;
                top: 410px;
                left: 300px;
                width: 425px;
                height: 310px;
                border-radius: 50px;
                box-shadow: 0px 4px 8px 0 rgba(0, 0, 0, 0.2);
            }
            .lower-right-bubble {
                background-color: rgb(240, 240, 240);
                position:fixed;
                top: 410px;
                left: 750px;
                width: 400px;
                height: 310px;
                border-radius: 50px;
                box-shadow: 0px 4px 8px 0 rgba(0, 0, 0, 0.2);
            }
            .bestday-steps-text {
                font-family:'Roboto', sans-serif;
                position: absolute;
                top: 10px;
                left: 100px;
                font-size: 30px;
            }
            .bestday-text {
                font-size: 70px;
                position:absolute;
                top: 40px;
                left: 115px;
            }
            .amountOfStepsOnBestDay-text {
                position: absolute;
                top: 160px;
                font-size: 30px;
                left: 160px;
            }
            .recommendedamount-text {
                font-family:'Roboto', sans-serif;
                position: absolute;
                top: 10px;
                left: 50px;
                font-size: 30px;
                width: 500px;
            }
            .youraverage-text {
                font-size:70px;
                position:absolute;
                top: 50px;
                left:80px
            }
            .green-triangle {
                color: rgb(36, 231, 36);
                font-size: 70px;
            }
            .red-triangle {
                color:red;
                font-size: 70px;
            }
            .logo { 
                width: 60px;
                height: 60px;
                z-index: 3;
                position: absolute;
                top: 30px;
                left: 10px;
            }
            .logo-title {
                color: white;
                position: absolute;
                font-size: 35px;
                left: 70px;
                top: 15px;
                font-style: italic;
            }
            div.dashboard-bubble {
                background-color:rgb(52, 52, 212);
                
                position: absolute; 
                width: 220px;
                height: 50px;
                top: 120px;
                left:10px;
                
                border-top-left-radius: 50px;
                border-bottom-left-radius: 50px;
            }
            div.dashboard-bubble:hover {
                background-color:rgb(52, 105, 212);;
            }
        </style>
    </head>
    <body>
        <div class = "left-side-bar">
            <img class = "logo" src = "FlexiTrackIcon.png">
            <p class = "logo-title">
                FlexiTrack
            </p>
            <div class = "dashboard-bubble">
                <p class = "left-side-bar-dashboard-text">Dashboard</p>
                
            </div>
        </div>
        <div class = "upper-middle-bubble">
            <div class = "steps-graph">

                <div class = "sunday-data-bar"></div>
                <div class = "monday-data-bar"></div>
                <div class = "tuesday-data-bar"></div>
                <div class = "wednesday-data-bar"></div>
                <div class = "thursday-data-bar"></div>
                <div class = "friday-data-bar"></div>
                <div class = "saturday-data-bar"></div>
            </div>
            <p id = "sunday-bar-label">S</p>
            <p id = "monday-bar-label">M</p>
            <p id = "tuesday-bar-label">T</p>
            <p id = "wednesday-bar-label">W</p>
            <p id = "thursday-bar-label">T</p>
            <p id = "friday-bar-label">F</p>
            <p id = "saturday-bar-label">S</p>
        </div>
        <div class = "lower-left-bubble">
            <p class = "bestday-steps-text">Best Day (Steps)</p>
            <p class = "bestday-text"><%=bestday%></p>
            <p class = "amountOfStepsOnBestDay-text"><%=amountOfStepsOnBestDay%></p>
        </div>
        <div class = "lower-right-bubble">
            <p class = "recommendedamount-text">Recommended Amount</p>
            <p class = "youraverage-text">
                <%=yourAverage %> 
                <% if (yourAverage < 7500) { %>
                    <span class = "red-triangle">&#9660;</span>
                <%} else {%>
                    <span class = "green-triangle">&#9650;</span>
                <%}%>
            </p>
        </div>
        
        <div class = "right-side-bar">
            <img class = "profile-pic" src = "EmptyAvatar.jpg">
            <p id = "welcome-text"></p>
            <div class = "update-data-bubble">
                <p class = "update-data-text">Update Today's Data</p>
                
                <p class = "steps-text">Number of Steps</p>
                <p class = "bsl-text">Blood Sugar Level</p>
                <p class = "moe-text">Minutes of Excercise</p>
                <form id = "data-form">  
                    <input class = "numberofsteps-input" type = "text" name = "steps-input"> 
                    <input class = "bsl-input" type = "text" name = "bsl-input"> 
                    <input class = "moe-input" type = "text" name = "moe-input"> 
                    <input type = "hidden" name = "value" value = "Jotishkumar">
                    <input class = "submit-data-button" type = "submit" value="Save">
                </form>
                <%
                    String nos = request.getParameter("steps-input");
                    String bsl = request.getParameter("bsl-input");
                    String moe = request.getParameter("moe-input");
                    if (nos != null && !bsl.isEmpty() && !nos.isEmpty() && !moe.isEmpty()&& bsl != null && moe !=null) {
                        try {
                            LocalDate ld = LocalDate.now();
                
                            DayOfWeek dayOfWeek = ld.getDayOfWeek();
                            String day = dayOfWeek.toString() + "DATA";
                
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                
                            Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "orcl");
                
                            PreparedStatement pstmt = c.prepareStatement("update FlexiTrackLoginInformation set " + day + " = ? where Username = ?");
                
                            pstmt.setString(1,nos);
                            pstmt.setString(2,"Jotishkumar");
                
                            pstmt.executeUpdate();
                            
                            c.close();
                
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
                <script>
                    function getQueryParam(name) {
                        const urlParams = new URLSearchParams(window.location.search);
                        return urlParams.get(name);
                    }
                    const username2 = getQueryParam('value');
                    document.getElementById('welcome-text').textContent = "Hello, " + username2;
                </script>

            </div>
        </div>
        
        
        <script>
            function getQueryParam(name) {
                const urlParams = new URLSearchParams(window.location.search);
                return urlParams.get(name)
            }

            const username = getQueryParam('value');
            document.getElementById('welcome-text').textContent = "Hello, " + username;
        </script>
    </body>
</html>