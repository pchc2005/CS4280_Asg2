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
            }    
        }
        function resete(){
             document.getElementById('book-movie').disabled = false;
             document.getElementById('book-movie').value='';     
             document.getElementById('book-house').disabled = true;
        }
    </script>
    <h2>Search Session</h2>
    <form name="booking" action="Session" method="POST">
	<label for="movie">Please choose the Movie:</label>
	<select id="book-movie" name="movieName" onchange="check(this);">
	    <c:forEach items="${movieInfo}" var="movie">
	    <option value="${movie.name}">${movie.name}</option>
	    </c:forEach>
	</select>
	<br/><br/>		                      
	<input id="search" type="submit" value="Search!" class="button" />
    </form>
</div>