<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
    String name = "", guid = "", email = "";
    if (session.getAttribute("authenticated") == null) {
        response.sendRedirect("index.jsp");
    } else if (session.getAttribute("authenticated").equals("true")) {
        name = session.getAttribute("name").toString();
        guid = session.getAttribute("guid").toString();
        email = session.getAttribute("email").toString();
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cryptex | Loading</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="../plugins/bower_components/jquery/dist/jquery.min.js"></script>
    </head>
    <body onload="show()">

        <div class="content">

        </div><!-- /content -->
        <div id="tableContainer-1">
            <div id="tableContainer-2">
                <table id="myTable" class="content">
                    <tr id="vis"><td >Soumik Paul</td>
                        <td>Online</td>
                    </tr>
                    <tr><td>Rwitam Bandyopadhyay</td>
                        <td>Online</td>
                    </tr>
                    <tr><td>Shakshi Baid</td>
                        <td class="r">Offline</td>
                    </tr>
                    <tr><td>Shiwangi Pasari</td>
                        <td class="r">Offline</td>
                    </tr>
                    <tr><td>Mohan Khandelwal</td>
                        <td class="r">Offline</td>
                    </tr>


                </table>
            </div>
        </div>
        <video id="my-video" class="video" loop>
            <source src="media/demo.mp4" type="video/mp4">
            <source src="media/demo.ogv" type="video/ogg">
            <source src="media/demo.webm" type="video/webm">
        </video><!-- /video -->


        <script>
            function show()
            {
                setTimeout(function () {
                    document.getElementById("tableContainer-2").style.visibility = "visible";
                }, 7000);

            }

            (function () {
                /**
                 * Video element
                 * @type {HTMLElement}
                 */
                var video = document.getElementById("my-video");

                /**
                 * Check if video can play, and play it
                 */
                video.addEventListener("canplay", function () {
                    video.play();
                });
            })();            
            $(window).ready(function () {
                setInterval(function () {
                    $.post("http://localhost:8080/CryptexWebsite/AccessCheck",
                            {
                                email: "<%out.print(email);%>"
                            },
                            function (data, status) {
                                alert(data);
                            });
                }, 5000);
            });
        </script>

    </body>
</html>