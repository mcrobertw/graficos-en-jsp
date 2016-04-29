<%@page language="java" contentType="text/html"%>
<%@page import="java.io.*"%>
<%@page import="org.jfree.chart.*"%>
<%@page import="org.jfree.chart.plot.*"%>
<%@page import="org.jfree.data.general.*"%>
<html>
<head><title>Hello World dynamic HTML</title></head>
<body>

<%
  
  //Se instancia un objeto que corresponde al tipo de gr�fico que queremos representar, 
  //en el cargaremos los datos para las series
  DefaultPieDataset data=new DefaultPieDataset();
  data.setValue("Enero", 5000);
  data.setValue("Febrero", 3000);
  data.setValue("Marzo", 2000);
  data.setValue("Abril", 7000);
  
  //Generar el gr�fico
  JFreeChart grafico=ChartFactory.createPieChart("Ingresos obtenidos 2016", data, 
                                                true, true, true);
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
