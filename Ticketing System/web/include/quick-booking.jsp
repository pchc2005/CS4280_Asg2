<%-- 
    Document   : quick-booking
    Created on : Apr 25, 2013, 4:10:50 PM
    Author     : Siuyan
--%>

<div id="quick-book" class="box">
    
    <script type="text/javascript">
        function check(elem) {
            if (elem.id == 'book-movie'){
                document.getElementById('book-house').disabled = false;

            }
            if (elem.id == 'book-movie' && elem.value==''){
                document.getElementById('book-house').disabled = true;
                document.getElementById('book-day').disabled = true;
            }
            if(elem.id== 'book-house'){
                document.getElementById('book-day').disabled = false;
            }
            if (elem.id == 'book-house' && elem.value==''){
                document.getElementById('book-day').disabled = true;
            }
    
        }
        function resete(){
             document.getElementById('book-movie').disabled = false;
             document.getElementById('book-movie').value='';     
             document.getElementById('book-house').disabled = true;
             document.getElementById('book-day').disabled = true;
        }
    </script>
		<h2>BOOK NOW</h2>
                <form name="booking" action="login" method="get">
                    <label for="movie">Please choose the Movie:</label>
                    <select id="book-movie" name="movie" onchange="check(this);">
                        <option value="" selected="selected"></option>
                        <c:forEach items="${movieInfo}" var="movie">
                        <option value="${movie.name}">${movie.name}</option>
                        </c:forEach>
                    </select>
		    <br/><br/>
                    <label for="house">Please choose the House:</label>
                    <select id="book-house" name="house" disabled="true" onchange="check(this);">
                        <option value="" selected="selected"></option>
                        <c:forEach items="${movieHouseInfo}" var="movieHouse">
                        <option value="${movieHouse.name}">${movieHouse.name}</option>
                        </c:forEach>
                    </select>
		    <br/><br/>
		    <label for="day">Please choose the Day and Time:</label>
                   <select id="book-day" name="day" disabled="true" onchange="check(this);">
                        <option value="" selected="selected"></option>
                        <option value="day1">day1</option>                        
                        <option value="day2">day2</option>
                        <option value="day3">day3</option>
                    </select>
                    <br/><br/>                    
                    <input type="submit" value="Book Now!" class="button" />
                    <input type="reset" onclick="resete();" value="Reset" class="button" />
		</form>
	    </div>