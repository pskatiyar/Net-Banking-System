<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="sun.jdbc.odbc.JdbcOdbcDriver"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" session="true" autoFlush="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>login</title>
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	color: #990000;
}
.style3 {font-family: "Footlight MT Light"; font-weight: bold; font-size: 16px; background-color:#E1E1E1 }
.style17 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style18 {
	color: #0033FF;
	font-size: 14px;
}
.style19 {
	font-size: 18px;
	color: #000000;
}
.style23 {font-family: "Gemina Condensed"}
.style26 {font-family: "Footlight MT Light"}
.style27 {font-size: 18px}
.style28 {font-family: "Footlight MT Light"; font-size: 18px; }
.style29 {font-family: "Gemina Condensed"; font-size: 24px; }
.style30 {
	font-family: Arial, Helvetica, sans-serif;
	color: #FF0000;
	font-size: 18px;
}
.style31 {font-size: 16px}
.style32 {
	font-family: Arial, Helvetica, sans-serif;
	color: #0033FF;
}
-->
</style>

<script type='text/javascript'>
function notEmpty(elem, helperMsg){
	if(elem.value.length == 0){
		alert(helperMsg);
		elem.focus();
		return false;
	}
	return true;
}

function del() {
	if((document.tp.tk3.value)==1)
		{
    var tk1 = document.getElementById("tk1");
    tk1.value = tk1.value.substr(0, tk1.value.length - 1);
		}
	if((document.tp.tk3.value)==2)
		
		{
		 var tk2 = document.getElementById("tk2");
		    tk2.value = tk2.value.substr(0, tk2.value.length - 1);
		}
}

function up()
{
  a=parseInt(1);   
  document.tp.tk3.value=a;

}

function down()
{
	a=parseInt(2);
	document.tp.tk3.value=a;
	}

</script>

<script type="text/javascript">
function caps()      {
     document.form2.btna.value="A";
     document.form2.btnb.value="B";
     document.form2.btnc.value="C";
     document.form2.btnd.value="D";
     document.form2.btne.value="E";
     document.form2.btnf.value="F";
     document.form2.btng.value="G";
     document.form2.btnh.value="H";
     document.form2.btni.value="I";
     document.form2.btnj.value="J";
     document.form2.btnk.value="K";
     document.form2.btnl.value="L";
     document.form2.btnm.value="M";
     document.form2.btnn.value="N";
     document.form2.btno.value="O";
     document.form2.btnp.value="P";
     document.form2.btnq.value="Q";
     document.form2.btnr.value="R";
     document.form2.btns.value="S";
     document.form2.btnt.value="T";
     document.form2.btnu.value="U";
     document.form2.btnv.value="V";
     document.form2.btnw.value="W";
     document.form2.btnx.value="X";
     document.form2.btny.value="Y";
     document.form2.btnz.value="Z";
}
</script>

<script type="text/javascript">
function small()      {
     document.form2.btna.value="a";
     document.form2.btnb.value="b";
     document.form2.btnc.value="c";
     document.form2.btnd.value="d";
     document.form2.btne.value="e";
     document.form2.btnf.value="f";
     document.form2.btng.value="g";
     document.form2.btnh.value="h";
     document.form2.btni.value="i";
     document.form2.btnj.value="j";
     document.form2.btnk.value="k";
     document.form2.btnl.value="l";
     document.form2.btnm.value="m";
     document.form2.btnn.value="n";
     document.form2.btno.value="o";
     document.form2.btnp.value="p";
     document.form2.btnq.value="q";
     document.form2.btnr.value="r";
     document.form2.btns.value="s";
     document.form2.btnt.value="t";
     document.form2.btnu.value="u";
     document.form2.btnv.value="v";
     document.form2.btnw.value="w";
     document.form2.btnx.value="x";
     document.form2.btny.value="y";
     document.form2.btnz.value="z";
}
</script>

<script type="text/javascript"> 
 
function printbtnt1()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt1.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt1.value;
} 
}


function printbtnt2()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt2.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt2.value;
} 
}

function printbtnt3()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt3.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt3.value;
} 
}

function printbtnt4()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt4.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt4.value;
} 
}

function printbtnt5()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt5.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt5.value;
} 
}

function printbtnt6()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt6.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt6.value;
} 
}


function printbtnt7()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt7.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt7.value;
} 
}

function printbtnt8()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt8.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt8.value;
} 
}

function printbtnt9()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt9.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt9.value;
} 
}


function printbtnt10()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt10.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt10.value;
} 
}


function printbtnt11()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt11.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt11.value;
} 
}


function printbtnt12()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt12.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt12.value;
} 
}


function printbtnt13()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt13.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt13.value;
} 
}

function printbtntl1()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btntl1.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btntl1.value;
} 
}

function printvalue1()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btn1.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btn1.value;
} 
}

function printvalue2()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btn2.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btn2.value;
} 
}

function printvalue3()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btn3.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btn3.value;
} 
}

function printvalue4()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btn4.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btn4.value;
} 
}

function printvalue5()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btn5.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btn5.value;
} 
}

function printvalue6()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btn6.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btn6.value;
} 
}

function printvalue7()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btn7.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btn7.value;
} 
}

function printvalue8()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btn8.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btn8.value;
} 
}

function printvalue9()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btn9.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btn9.value;
} 
}

function printvalue0()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btn0.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btn0.value;
} 
}

function printbtntr1()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btntr1.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btntr1.value;
} 
}

function printbtntr2()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btntr2.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btntr2.value;
} 
}

function printvaluea()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btna.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btna.value;
} 
}

function printvalueb()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnb.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnb.value;
} 
}
function printvaluec()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnc.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnc.value;
} 
}
function printvalued()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnd.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnd.value;
} 
}
function printvaluee()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btne.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btne.value;
} 
}
function printvaluef()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnf.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnf.value;
} 
}
function printvalueg()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btng.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btng.value;
} 
}
function printvalueh()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnh.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnh.value;
} 
}
function printvaluei()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btni.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btni.value;
} 
}
function printvaluej()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnj.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnj.value;
} 
}
function printvaluek()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnk.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnk.value;
} 
}
function printvaluel()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnl.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnl.value;
} 
}
function printvaluem()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnm.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnm.value;
} 
}
function printvaluen()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnn.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnn.value;
} 
}
function printvalueo()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btno.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btno.value;
} 
}
function printvaluep()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnp.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnp.value;
} 
}
function printvalueq()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnq.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnq.value;
} 
}
function printvaluer()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnr.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnr.value;
} 
}
function printvalues()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btns.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btns.value;
} 
}
function printvaluet()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnt.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnt.value;
} 
}
function printvalueu()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnu.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnu.value;
} 
}
function printvaluev()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnv.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnv.value;
} 
}
function printvaluew()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnw.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnw.value;
} 
}
function printvaluex()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnx.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnx.value;
} 
}
function printvaluey()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btny.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btny.value;
} 
}
function printvaluez()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnz.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnz.value;
} 
}

function printbtnm3()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnm3.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnm3.value;
} 
}

function printbtnm2()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnm2.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnm2.value;
} 
}

function printbtnm1()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnm1.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnm1.value;
} 
}

function printbtnml4()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnml4.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnml4.value;
} 
}

function printbtnml3()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnml3.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnml3.value;
} 
}

function printbtnml2()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnml2.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnml2.value;
} 
}

function printbtnml1()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnml1.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnml1.value;
} 
}
function printbtnb6()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnb6.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnb6.value;
} 
}

function printbtnb5()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnb5.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnb5.value;
} 
}

function printbtnb4()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnb4.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnb4.value;
} 
}

function printbtnb3()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnb3.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnb3.value;
} 
}

function printbtnb2()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnb2.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnb2.value;
} 
}

function printbtnb1()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnb1.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnb1.value;
} 
}

function printbtnl3()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnl3.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnl3.value;
} 
}

function printbtnl2()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnl2.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnl2.value;
} 
}

function printbtnl1()
{
  if((document.tp.tk3.value)==1)
{
      document.tp.tk1.value+= document.form2.btnl1.value;
}
   if((document.tp.tk3.value)==2)
{
   document.tp.tk2.value+= document.form2.btnl3.value;
} 
}

  
 function enablebtn()
{
document.form2.btn1.disabled=false;
document.form2.btn2.disabled=false;
document.form2.btn3.disabled=false;
document.form2.btn4.disabled=false;
document.form2.btn5.disabled=false;
document.form2.btn6.disabled=false;
document.form2.btn7.disabled=false;
document.form2.btn8.disabled=false;
document.form2.btn9.disabled=false;
document.form2.btn0.disabled=false;
document.form2.btna.disabled=false;
document.form2.btnb.disabled=false;
document.form2.btnc.disabled=false;
document.form2.btnd.disabled=false;
document.form2.btne.disabled=false;
document.form2.btnf.disabled=false;
document.form2.btng.disabled=false;
document.form2.btnh.disabled=false;
document.form2.btni.disabled=false;
document.form2.btnj.disabled=false;
document.form2.btnk.disabled=false;
document.form2.btnl.disabled=false;
document.form2.btnm.disabled=false;
document.form2.btnn.disabled=false;
document.form2.btno.disabled=false;
document.form2.btnp.disabled=false;
document.form2.btnq.disabled=false;
document.form2.btns.disabled=false;
document.form2.btnt.disabled=false;
document.form2.btnr.disabled=false;
document.form2.btnu.disabled=false;
document.form2.btnv.disabled=false;
document.form2.btnw.disabled=false;
document.form2.btnx.disabled=false;
document.form2.btny.disabled=false;
document.form2.btnz.disabled=false;
document.form2.btnt1.disabled=false;
document.form2.btnt2.disabled=false;
document.form2.btnt3.disabled=false;
document.form2.btnt4.disabled=false;
document.form2.btnt5.disabled=false;
document.form2.btnt6.disabled=false;
document.form2.btnt7.disabled=false;
document.form2.btnt8.disabled=false;
document.form2.btnt9.disabled=false;
document.form2.btnt10.disabled=false;
document.form2.btnt11.disabled=false;
document.form2.btnt12.disabled=false;
document.form2.btnt13.disabled=false;
document.form2.btntl1.disabled=false;
document.form2.btntr1.disabled=false;
document.form2.btntr2.disabled=false;
document.form2.btnm3.disabled=false;
document.form2.btnm2.disabled=false;
document.form2.btnm1.disabled=false;
document.form2.btnml4.disabled=false;
document.form2.btnml3.disabled=false;
document.form2.btnml2.disabled=false;
document.form2.btnml1.disabled=false;
document.form2.btnb6.disabled=false;
document.form2.btnb5.disabled=false;
document.form2.btnb4.disabled=false;
document.form2.btnb3.disabled=false;
document.form2.btnb2.disabled=false;
document.form2.btnb1.disabled=false;
document.form2.btnl3.disabled=false;
document.form2.btnl2.disabled=false;
document.form2.btnl1.disabled=false;
document.form2.capon.disabled=false;
document.form2.capoff.disabled=false;
document.form2.tab.disabled=false;
document.form2.toggle.disabled=false;
document.form2.clear.disabled=false;


}
 </script>
 <script type="text/javascript">
 function noBack()
 {
 window.history.forward(1);
 }
 
 var message="Right Click is not possible Here !";
 function click(e) {
 if (document.all) {
 if (event.button == 2) {
 alert(message);
 return false;
 }
 }
 if (document.layers) {
 if (e.which == 3) {
 alert(message);
 return false;
 }
 }
 }
 if (document.layers) {
 document.captureEvents(Event.MOUSEDOWN);
 }
 document.onmousedown=click;
</script>

</head>

<body onload="noBack()">

<table width="1250" border="0" align="center" >
  <tr>
    <td width="1248"><%@include file="logintop.jsp" %></td>
  </tr>
   <tr>
    <td height="204"><table width="952"  border="0" align="center"  bgcolor="#FFFFFF" cellpadding="5">    
<tr>
    <td width="413" height="339" bgcolor="#FFFFFF">
     <fieldset>
      <legend><span class="style23">LOGIN HERE</span></legend>
      <table width="411" cellpadding="5" align="center">
        <tr>
          <td width="393" align="center"><p class="style28"><strong>To Access Your Account Please</strong></p>
            <p class="style29">LOGIN TO DDSV</p>    
            
            <span class="style1">
                 <%
try
{
	String s1=request.getParameter("tk1");
	String s2=request.getParameter("tk2");
 		
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
    String q1 ="select * from user_details";
    ResultSet rs=smt.executeQuery(q1);
    String a="active";
    String a1="yes";
    int f=0;
    while(rs.next())
    {
    	    String account= rs.getString("nid");
    	    String cusid= rs.getString("npass");
    	    String name1= rs.getString("NAME");
    	    String acc= rs.getString("ACC_NO");
    	    String branch= rs.getString("BRANCH_NAME");
    	    String balance= rs.getString("BALANCE");
    	    String netissue=rs.getString("NET_BANKING_ISSUE");
    	    String phone=rs.getString("PHONE_NO");
    	    if(s1.equals(account) && s2.equals(cusid) && a.equals(netissue))
    	    {
    	    	f=1;
    	    	response.sendRedirect("welcome.jsp");
    	    out.println("welcome user");
    	    session.setAttribute( "theName", name1 );
    	    session.setAttribute( "theacc", acc );
    	    session.setAttribute( "thephone", phone );
    	    session.setAttribute( "theName2", branch );
    	   session.setAttribute( "theName3", balance );
    	    }
    	    
    	    if(s1.equals(account) && s2.equals(cusid) && ( a1.equals(netissue)))
    	    {
    	    	session.setAttribute( "theName", name1 );
	    	    session.setAttribute( "theacc", acc );
	    	    session.setAttribute( "theName2", branch );
	    	   session.setAttribute( "theName3", balance );
    	    	response.sendRedirect("setusernamepass.jsp");
    	    	  
    	    }
    	    
    }
    if(f==0)
    {
    
	 out.println("Invalid User Name Or Password!!!");
    }
    	
    con.close();
}

catch(Exception e){

}

%>
<%
  // String name = request.getParameter( "tk1" );
   //session.setAttribute( "theName", name1 );
%>
    </span>        
                    </td>
        </tr>
      </table>
      <form id="form1" name="tp" method="post" action="log in.jsp">
        <p>
          <label><span class="style26"><span class="style27">USER ID:</span></span> &nbsp;&nbsp;&nbsp;
          <input type="text" name="tk1" id="tk1" onfocus="up()" size="30" />
          </label>
          </p>
        <p>
          <label><span class="style28">PASSWORD</span>:&nbsp;
            <input type="password" name="tk2" id="tk2" onfocus="down()" size="31"/>
            </label>
        </p>
      
        <p>
          <label>
          <input type="hidden" name="tk3" id="tk3" value="1"/>
          </label>
          <label>
          <input name="btnchk" type="checkbox" class="style3" id="btnchk" onclick="enablebtn()"/> 
          <span class="style32">Enable virtual keyboard.          </span></label>
        </p>
        
        <p>
          <label></label>
          <label>
          <input type="submit" class="style3" name="btnsubmit" id="btnsubmit" value="SIGN IN" onclick="notEmpty(document.getElementById('tk1'), 'Please Enter USER NAME')"/>
          </label>
          <label>
          <input name="btnrst" type="reset" class="style3" id="btnrst" value="RESET" />
          </label>
        </p>
      </form>
      </fieldset> <br/>    <span class="style30"><span class="style31">*For better security use the Online Virtual Keyboard to login</span>.</span> </td>
    <td width="513" bgcolor="#FFFFFF"><table width="495" border="1" align="center" cellpadding="3" bgcolor="#CCCCCC">
    <tr>
    <td>
      <span class="style23">Virtual Keyboard      </span></td>
    </tr>
      <tr>
        <td width="475" align="center">
        <form name="form2" id="form2" >
          
                    <input name="btnt1" type="button" class="style3" id="btnt1" value="~" disabled="disabled" onclick="printbtnt1()" />
                    
                    <span class="style3">
                    <input name="btnt2" type="button" class="style3" id="btnt2" value="!" disabled="disabled" onclick="printbtnt2()"/>
                    
                    <input name="btnt3" type="button" class="style3" id="btnt3" value="@" disabled="disabled" onclick="printbtnt3()" />
                    <input name="btnt4" type="button" class="style3" id="btnt4" value="#" disabled="disabled" onclick="printbtnt4()"/>
                    <input name="btnt5" type="button" class="style3" id="btnt5" value="$" disabled="disabled" onclick="printbtnt5()"/>
                    <input name="btnt6" type="button" class="style3" id="btnt6" value="%" disabled="disabled" onclick="printbtnt6()"/>
                    <input name="btnt7" type="button" class="style3" id="btnt7" value="^" disabled="disabled" onclick="printbtnt7()"/>
                    <input name="btnt8" type="button" class="style3" id="btnt8" value="&amp;" disabled="disabled" onclick="printbtnt8()"/>
                    <input name="btnt9" type="button"  class="style3" id="btnt9" value="*" disabled="disabled" onclick="printbtnt9()"/>
                    <input name="btnt10" type="button" class="style3" id="btnt10" value="(" disabled="disabled" onclick="printbtnt10()"/>
                    <input name="btnt11" type="button" class="style3" id="btnt11" value=")" disabled="disabled" onclick="printbtnt11()"/>
                    <input name="btnt12" type="button" class="style3" id="btnt12" value="_" disabled="disabled" onclick="printbtnt12()"/>
                    <input name="btn13" type="button" class="style3" id="btnt13" value="+" disabled="disabled" onclick="printbtnt13()"/>
                    <br />
               	     <input name="btntl1" type="button" class="style3" id="btntl1" value="`" disabled="disabled" onclick="printbtntl1()"/>
                    <input name="btn1" type="button" class="style3" id="btn1" value="1" disabled="disabled" onclick="printvalue1()"/>
                    <input name="btn2" type="button" class="style3" id="btn2" value="2" disabled="disabled" onclick="printvalue2()"/>
                    <input name="btn3" type="button" class="style3" id="btn3" value="3" disabled="disabled" onclick="printvalue3()"/>
                    <input name="btn4" type="button" class="style3" id="btn4" value="4" disabled="disabled" onclick="printvalue4()"/>
                    <input name="btn5" type="button" class="style3" id="btn5" value="5" disabled="disabled" onclick="printvalue5()"/>
                    <input name="btn6" type="button" class="style3" id="btn6" value="6" disabled="disabled" onclick="printvalue6()"/>
                    <input name="btn7" type="button" class="style3" id="btn7" value="7" disabled="disabled" onclick="printvalue7()"/>
                    <input name="btn8" type="button" class="style3" id="btn8" value="8" disabled="disabled" onclick="printvalue8()"/>
                    <input name="btn9" type="button" class="style3" id="btn9" value="9" disabled="disabled" onclick="printvalue9()"/>
                    <input name="btn0" type="button" class="style3" id="btn0" value="0" disabled="disabled" onclick="printvalue0()"/>
                    <input name="btntr1" type="button" class="style3" id="btntr1" value="-" disabled="disabled" onclick="printbtntr1()"/>
                    <input name="btntr2" type="button" class="style3" id="btntr2" value="=" disabled="disabled"  onclick="printbtntr2()"/>
                    <br />
                    <input name="btnq" type="button" class="style3" id="btnq" value="q" disabled="disabled" onclick="printvalueq()"/>
                    <input name="btnw" type="button" class="style3" id="btnw" value="w" disabled="disabled" onclick="printvaluew()"/>
                    <input name="btne" type="button" class="style3" id="btne" value="e" disabled="disabled" onclick="printvaluee()"/>
                    <input name="btnr" type="button" class="style3" id="btnr" value="r" disabled="disabled" onclick="printvaluer()"/>
                    <input name="btnt" type="button" class="style3" id="btnt" value="t" disabled="disabled" onclick="printvaluet()"/>
                    <input name="btny" type="button" class="style3" id="btny" value="y" disabled="disabled" onclick="printvaluey()"/>
                    <input name="btnu" type="button"  class="style3" id="btnu" value="u" disabled="disabled" onclick="printvalueu()"/>
                    <input name="btni" type="button" class="style3" id="btni" value="i" disabled="disabled" onclick="printvaluei()"/>
                    <input name="btno" type="button"  class="style3" id="btno" value="o" disabled="disabled" onclick="printvalueo()"/>
                    <input name="btnp" type="button" class="style3" id="btnp" value="p" disabled="disabled" onclick="printvaluep()"/>
                    <input name="btnm3" type="button" class="style3" id="btnm3" value="{" disabled="disabled" onclick="printbtnm3()"/>
                    <input name="btnm2" type="button" class="style3" id="btnm2" value="}" disabled="disabled" onclick="printbtnm2()"/>
                    <input name="btnm1" type="button" class="style3" id="btnm1" value="|" disabled="disabled" onclick="printbtnm1()"/>
                    <br />
                    <input name="btna" type="button" class="style3" id="btna" value="a" disabled="disabled" onclick="printvaluea()"/>
                    <input name="btns" type="button" class="style3" id="btns" value="s" disabled="disabled" onclick="printvalues()"/>
                    <input name="btnd" type="button" class="style3" id="btnd" value="d" disabled="disabled" onclick="printvalued()"/>
                    <input name="btnf" type="button" class="style3" id="btnf" value="f" disabled="disabled" onclick="printvaluef()"/>
                    <input name="btng" type="button" class="style3" id="btng" value="g" disabled="disabled" onclick="printvalueg()"/>
                    <input name="btnh" type="button" class="style3" id="btnh" value="h" disabled="disabled" onclick="printvalueh()"/>
                    <input name="btnj" type="button" class="style3" id="btnj" value="j" disabled="disabled" onclick="printvaluej()"/>
                    <input name="btnk" type="button" class="style3" id="btnk" value="k" disabled="disabled" onclick="printvaluek()"/>
                    <input name="btnl" type="button" class="style3" id="btnl" value="l" disabled="disabled" onclick="printvaluel()"/>
                    <input name="btnml4" type="button" class="style3" id="btnml4" value="[" disabled="disabled" onclick="printbtnml4()"/>
                    <input name="btnml3" type="button" class="style3" id="btnml3" value="]" disabled="disabled" onclick="printbtnml3()"/>
                    <input name="btnml2" type="button" class="style3" id="btnml2" value="\" disabled="disabled" onclick="printbtnml2()"/>
                    <input name="btnml1" type="button" class="style3" id="btnml1" value="/" disabled="disabled" onclick="printbtnml1()"/>
                    <br />
                    <input name="btnz" type="button" class="style3" id="btnz" value="z" disabled="disabled" onclick="printvaluez()"/>
                    <input name="btnx" type="button" class="style3"  id="btnx" value="x" disabled="disabled" onclick="printvaluex()"/>
                    <input name="btnc" type="button" class="style3" id="btnc" value="c" disabled="disabled" onclick="printvaluec()"/>
                    <input name="btnv" type="button" class="style3" id="btnv" value="v" disabled="disabled" onclick="printvaluev()"/>
                    <input name="btnb" type="button" class="style3" id="btnb" value="b" disabled="disabled" onclick="printvalueb()"/>
                    <input name="btnn" type="button" class="style3" id="btnn" value="n" disabled="disabled" onclick="printvaluen()"/>
                    <input name="btnm" type="button" class="style3" id="btnm" value="m" disabled="disabled" onclick="printvaluem()"/>
                    <input name="btnb6" type="button" class="style3" id="btnb6" value="&lt;" disabled="disabled" onclick="printbtnb6()"/>
                    <input name="btnb5" type="button" class="style3" id="btnb5" value="&gt;" disabled="disabled" onclick="printbtnb5()"/>
                    <input name="btnb4" type="button" class="style3" id="btnb4" value=";" disabled="disabled" onclick="printbtnb4()"/>
                    <input name="btnb3" type="button" class="style3" id="btnb3" value=":" disabled="disabled" onclick="printbtnb3()"/>
                    <input name="btnb2" type="button" class="style3" id="btnb2" value="'" disabled="disabled" onclick="printbtnb2()"/>
                    <input name="btnb1" type="button" class="style3" id="btnb1" value='"' disabled="disabled" onclick="printbtnb1()"/>
                    <br />
                    <input name="capson" type="button" class="style3" value="CAPS ON" id="capon" disabled="disabled" onclick="caps()" />
                    <input name="capsoff" type="button" class="style3" value="CAPS OFF" id="capoff" disabled="disabled" onclick="small()" />
                    
                    <input name="btntab" type="button" class="style3" id="tab" value="TAB↑" disabled="disabled" onclick="up()" />
                    <input name="btntoggle" type="button" class="style3" id="toggle" value="TAB↓" disabled="disabled" onclick="down()" />
                    <input name="clear" type="button" class="style3" id="clear" value="DEL" disabled="disabled" onclick="del()"/>
                    <input name="btnl3" type="button" class="style3" id="btnl3" value="." disabled="disabled" onclick="printbtnl3()"/>
                    <input name="btnl2" type="button" class="style3" id="btnl2" value="?" disabled="disabled" onclick="printbtnl2()"/>
                    <input name="btnl1" type="button" class="style3" id="btnl1" value="," disabled="disabled" onclick="printbtnl1()" />
                    </span>
        </form>
        
         </td>
      </tr>
    </table></td>
  </tr>
     </table>
      <table width="952" border="0" align="center" bgcolor="#FFFFFF" cellpadding="10">
        <tr>
          <td width="952" class="style17"><p>&nbsp;</p>
          <p><span class="style19">Important:</span> <span class="style18">DDSV or any of its   representative never sends you email/SMS or calls you over phone to get   your personal information, password or one time SMS (high security)   password. Any such e-mail/SMS or phone call is an attempt to   fraudulently withdraw money from your account through Internet Banking.   Never respond to such email/SMS or phone call. Please report immediately   with us.if   you receive any such email/SMS or Phone call. Immediately change your   passwords if you have accidentally revealed your credentials.</span></p>
          <p>&nbsp;</p></td>
        </tr>
      </table>
     </td>
  </tr>
  <tr>
    <td height="20"><%@include file="footer.jsp" %></td>
  </tr>
</table>

</body>
</html>
