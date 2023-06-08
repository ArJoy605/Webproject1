<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%
	if(session.getAttribute("name")==null || !session.getAttribute("role").equals("teacher")){
		response.sendRedirect("index.jsp");
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/2494fc36bc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="styles.css">
</head>
<body class="overflow-x-hidden">
    <div class="flex justify-between items-center w-full text-gray-700 bg-white dark-mode:text-gray-200 dark-mode:bg-gray-800 shadow-lg">
        <div class="flex flex-row items-center justify-between p-4">
            <a href="/Web/homeT.jsp" class="text-xl font-semibold tracking-widest text-gray-900 uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Management System SUST</a>
        </div>
        <div>
            <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-red-200 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/Web/logout"><i class="fa-solid fa-right-from-bracket"></i>  Log Out</a>
                <a class="px-4 py-2 mr-6 mt-2 text-md border border-gray hover:border-black font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#"><i class="fa-solid fa-user"></i>  <%= session.getAttribute("name") %> </a>
            </nav>
        </div>
    </div>
    <div>
        <div class="mx-10 mt-10 pb-4 text-2xl font-semibold tracking-widest border-b border-gray-400">
            Students List:
        </div>
        <div class="px-10 h-60 overflow-x-hidden overflow-y-auto">
        <table class="mt-6 w-full leading-normal">
            <thead>
                <tr>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Name
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Department
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Email
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                        Action
                    </th>
                </tr>
            </thead>
            <tbody>
            <% try{
            						String ccode = request.getParameter("ccode");
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech?useSSL=false","root","mynewpassword");
                    				PreparedStatement pst = con.prepareStatement("select * from stcourses where ccode = ?");
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				pst.setString(1,ccode);
                    				//out.println(pst);
                    				ResultSet res = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(res.next()){ %>
                <tr>
                    <td class="px-5 py-2 border-b border-gray-200 bg-white text-sm">
                        <div class="flex justify-left">
                                <div>
                                    <p class="text-gray-900 font-semibold whitespace-no-wrap">
                                        <%= res.getString("student") %>
                                    </p>
                                </div>
                            </div>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <p class="text-gray-900 whitespace-no-wrap"><%= res.getString("dept") %></p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <p class="text-gray-900 whitespace-no-wrap">
							<%= res.getString("stemail") %>
                        </p>
                    </td>
                    <td class="px-5 border-b border-gray-200 bg-white text-sm">
                        <button class="bg-red-400 px-4 py-3 rounded-full  border border-[#F0F0F6] shadow-xl hover:bg-red-600 leading-tight">
                            <i class="fa-sharp fa-solid fa-trash"></i>  Remove
                        </button>
                    </td>
                </tr>
                <%}
            		}catch(Exception e){
            			e.printStackTrace();
            		}
                %>
            </tbody>
        </table>
    </div>
    </div>
</div>
</div>
    </div>
    <div>
    </div>
        <div> <!-- for footer -->
            <footer class="mt-20 w-full bg-white">
                <div class="text-center">
                    <h3> &copy; 2023 Course Management System SUST - All rights reserved</h3>
                </div>
            </footer>
        </div>  
        <script>
        	var button = document.getElementById("delButton");
        	button.onclick = function(){
        		console.log("clicked!");
        	}
        </script>    
</body>
</html>