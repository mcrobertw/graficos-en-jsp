<%@page language="java" contentType="text/html"%>
<%@page import="java.io.*"%>
<%@page import="org.jfree.chart.*"%>
<%@page import="org.jfree.chart.plot.*"%>
<%@page import="org.jfree.data.category.*"%>
<html>
<head><title>Hello World dynamic HTML</title></head>
<body>

<%
  
  //Se instancia un objeto que corresponde al tipo de gráfico que queremos representar, 
  //en el cargaremos los datos para las series
  DefaultCategoryDataset data=new DefaultCategoryDataset();
  data.setValue(2000,"Ingreso", "Enero");
  data.setValue(1000,"Ingreso", "Febrero");
  data.setValue(3000,"Ingreso", "Marzo");
  data.setValue(1500,"Ingreso","Abril");
  
  //Generar el gráfico
  /*
   argumentos de la función createBarChart
  titulosuperior, titulo inferior. titulo secundario, indicar la data, PlotOrientation.HORIZONTAL o PlotOrientation.VERTICAL,
  leyenda: true or false, visualización de tooltext: true or false, mensaje url: true or false
  
  */
  JFreeChart grafico=ChartFactory.createBarChart(
          
          "Ingresos obtenidos 2016", "Meses","Promedio",data,PlotOrientation.VERTICAL,true, true, true);
  //Medio donde se visualizará el gráfico
  response.setContentType("image/JPEG");
  OutputStream sa=response.getOutputStream();
  
  //Impresión del gráfico
  ChartUtilities.writeChartAsJPEG
        /*
          out.- Cual es el medio que representa el dispositivo de salida
          chart- Cual es el objeto que tiene el gráfico ensamblado
          width y height- Alto y ancho respectivamente                */
        
                  
        (sa, grafico, 500, 500);
%>
</body>
</html>
