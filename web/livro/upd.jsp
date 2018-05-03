<%@page import="util.StormData"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Editora"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
String msg ="";
String classe = "";
    
    LivroDAO dao = new LivroDAO();
    Livro obj = new Livro();
    Editora e = new Editora();
    Categoria c = new Categoria();
    BigDecimal preco = new BigDecimal(Float.toString(123.4f));

    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no form
        e.setCnpj(request.getParameter("txtCnpj"));
        c.setId(Integer.parseInt(request.getParameter("txtId")));
        obj.setId(Integer.parseInt(request.getParameter("txtId")));
        obj.setNome(request.getParameter("txtNome"));
        obj.setPreco(Float.parseFloat(request.getParameter("txtPreco")));   
        obj.setSinopse(request.getParameter("txtSinopse"));
        obj.setDatapublicacao(StormData.formata("dd/MM/yyyy"));
        obj.setEditora(e);
        obj.setCategoria(c);
        obj.setFoto1(request.getParameter("txtFoto1"));
        obj.setFoto2(request.getParameter("txtFoto2"));
        obj.setFoto3(request.getParameter("txtFoto3"));
         
        
        Boolean resultado = dao.alterar(obj);
        
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }
        
    }else{
        //e GET
        if(request.getParameter("codigo") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        
        dao = new LivroDAO();
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
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Livro
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="post" enctype="multipart/form-data">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Código:</label>
                        <input class="form-control" type="text" name="txtId" readonly value="<%=obj.getId()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Nome:</label>
                        <input class="form-control" type="text" name="txtNome" required value="<%=obj.getNome() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Preço:</label>
                        <input class="form-control" type="text" name="txtPreco" required value="<%=obj.getPreco() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Sinopse:</label>
                        <input class="form-control" type="text" name="txtSinopse" required value="<%=obj.getSinopse() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Data Publicação:</label>
                        <input class="form-control" type="text" name="txtDatapublicacao" required value="<%=obj.getDatapublicacao() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Editora:</label>
                        <input class="form-control" type="text" name="txtEditora" required value="<%=obj.getEditora() %>" />
                    </div>
                    
                    
                    <div class="form-group">
                        <label>Categoria:</label>
                        <input class="form-control" type="text" name="txtCategoria" required value="<%=obj.getCategoria() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Foto 1:</label>
                        <input type="file" name="txtFoto1" required value="<%=obj.getFoto1() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Foto 2:</label>
                        <input type="file" name="txtFoto2" required value="<%=obj.getFoto2() %>" />
                    </div>
                    <div class="form-group">
                        <label>Foto 3:</label>
                        <input type="file" name="txtFoto3" required value="<%=obj.getFoto3() %>" />
                    </div>

                <button class="btn btn-info btn-sm" type="submit">Salvar</button>
                
            </form>
s
        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>