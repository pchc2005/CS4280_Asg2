<%-- 
    Document   : quick-booking
    Created on : Apr 25, 2013, 4:10:50 PM
    Author     : Siuyan
--%>

<div id="quick-book" class="box">
		<h2>BOOK NOW</h2>
                <form name="booking" action="login" method="get">
                    <label for="movie">Please choose the Movie you want:</label>
                    <select name="movie">
                        <option value="movie1">movie1</option>
                        <option value="movie2">movie2</option>
                        <option value="movie3">movie3</option>
                    </select>
		    <br/><br/>
                    <label for="house">Please choose the House:</label>
                    <select name="house">
                        <option value="house1">house1</option>
                        <option value="house2">house2</option>
                        <option value="house3">house3</option>
                    </select>
		    <br/><br/>
		    <label for="day">Please choose the Day:</label>
		    <select name="day">
			<option value="day1">day1</option>
                        <option value="day2">day2</option>
                        <option value="day3">day3</option>
                    </select>
                    <br/><br/>
                    <label for="time">Please choose the Time:</label>
                    <select name="time">
                        <option value="time1">time1</option>
                        <option value="time2">time2</option>
                        <option value="time3">time3</option>
                    </select> 
                    <br/><br/> 
                    <input type="submit" value="Book Now!" class="button" />
                    <input type="reset" onclick="formReset()" value="Reset" class="button" />
		</form>
	    </div>