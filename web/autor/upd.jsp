<%@page import="modelo.Autor"%>
<%@page import="dao.AutorDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
String msg ="";
String classe = "";
    
    AutorDAO dao = new AutorDAO();
    Autor obj = new Autor();
    //verifica se � postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no form
        obj.setId(Integer.parseInt(request.getParameter("txtId")));
        obj.setNome(request.getParameter("txtNome"));
        obj.setNacionalidade(request.getParameter("txtNacionalidade"));
        obj.setSexo(request.getParameter("txtSexo").charAt(0));
        obj.setFoto(request.getParameter("txtFoto"));
        
        Boolean resultado = dao.alterar(obj);
        
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "N�o foi poss�vel alterar";
            classe = "alert-danger";
        }
        
    }else{
        //e GET
        if(request.getParameter("codigo") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        
        dao = new AutorDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("index.jsp");
            return;
        } 
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Com�rcio Eletr�nico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">�rea Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conte�do de apresenta��o
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Autor
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="post" enctype="multipart/form-data">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>C�digo:</label>
                        <input class="form-control" type="text" name="txtId" readonly value="<%=obj.getId()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Nome:</label>
                        <input class="form-control" type="text" name="txtNome" required value="<%=obj.getNome() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Nacionalidade:</label>
                        <input class="form-control" type="text" name="txtNacionalidade" required value="<%=obj.getNacionalidade() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Sexo:</label>
                        <input class="form-control" type="text" name="txtSexo" required value="<%=obj.getSexo() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Foto:</label>
                        <input type="file" name="txtFoto" required value="<%=obj.getFoto() %>" />
                    </div>

                <button class="btn btn-info btn-sm" type="submit">Salvar</button>
                
            </form>
s
        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>