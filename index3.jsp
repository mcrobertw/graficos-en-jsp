<!--Representaci�n con acceso a MYSQL-->

<%@page language="java" contentType="text/html"%>
<%@page import="java.io.*"%>
<%@page import="org.jfree.chart.*"%>
<%@page import="org.jfree.chart.plot.*"%>
<%@page import="org.jfree.data.category.*"%>
<%@page import="java.sql.*"%>
<html>
<head><title>Hello World dynamic HTML</title></head>
<body>

<%
  
  //Activando conexi�n  
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/telesup","root","");
  
  //Creando objeto de tipo comando
  Statement cmd=cn.createStatement();
  
  String sql="Select c.nomcarrera, COUNT(m.idcarrera) as cant FROM matricula m, carrera c "
          + "WHERE m.idcarrera=c.idcarrera GROUP BY m.idcarrera;";
  
  ResultSet rs=cmd.executeQuery(sql);
  //Se instancia un objeto que corresponde al tipo de gr�fico que queremos representar, 
  //en el cargaremos los datos para las series
  DefaultCategoryDataset data=new DefaultCategoryDataset();
  
  while (rs.next()){
      data.setValue(rs.getInt(2), "Matriculados", rs.getString(1));
  }
      
    
  //Generar el gr�fico
  /*
   argumentos de la funci�n createBarChart
  titulosuperior, titulo inferior. titulo secundario, indicar la data, PlotOrientation.HORIZONTAL o PlotOrientation.VERTICAL,
  leyenda: true or false, visualizaci�n de tooltext: true or false, mensaje url: true or false
  
  */
  JFreeChart grafico=ChartFactory.createBarChart(
          
          "Matriculados por carrera", "Alumnos","Cantidad",data,PlotOrientation.VERTICAL,true, true, true);
  //Medio donde se visualizar� el gr�fico
  response.setContentType("image/JPEG");
  OutputStream sa=response.getOutputStream();
  
  //Impresi�n del gr�fico
  ChartUtilities.writeChartAsJPEG
        /*
          out.- Cual es el medio que representa el dispositivo de salida
          chart- Cual es el objeto que tiene el gr�fico ensamblado
          width y height- Alto y ancho respectivamente                */
        
                  
        (sa, grafico, 500, 500);
%>
</body>
</html>
