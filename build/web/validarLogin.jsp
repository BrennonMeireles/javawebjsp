<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
    //Fazendo a conexão com o banco de dados
    Connection conecao;
    Class.forName("com.mysql.cj.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3307/bancojsdp";
    String user = "root";
    String password = "";

    conecao = DriverManager.getConnection(url, user, password);

    if (conecao != null) {
        if ((request.getParameter("txtuser") != null) && (request.getParameter("txtpass") != null)) {
            String login, pass;
            login = request.getParameter("txtuser");
            pass = request.getParameter("txtpass");
            Statement st;
            ResultSet rs;
            st = conecao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
            rs = st.executeQuery("select * from login where email ='" + login + "' and senha='" + pass + "'");
            if (rs.next()) {
                response.sendRedirect("home.html");
            }
            // out.println(login);
            //  out.println(pass);
        }
    } else {
        out.print("Não é  possivel logar");
    }
%>
