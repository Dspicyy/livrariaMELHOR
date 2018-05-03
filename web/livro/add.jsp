<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Autor"%>
<%@page import="dao.AutorDAO"%>
<%@include file="../rodape.jsp" %>
<%@page import="util.StormData"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Editora"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Livro"%>
<%@page import="java.util.List"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    Livro obj = new Livro();
    Editora e = new Editora();
    Categoria c = new Categoria();
    AutorDAO adao = new AutorDAO();
    LivroDAO dao = new LivroDAO();
    
   
 if(request.getMethod().equals("POST")){
        //pego uma lista de autores(com mesmo name)
        
        String[] autoresid = request.getParameter("autores").split(";");
        //popular o livro
        
        e.setCnpj(request.getParameter("txtCnpj"));
        c.setId(Integer.parseInt(request.getParameter("txtId")));
        obj.setNome(request.getParameter("txtNome"));
        obj.setPreco(Float.parseFloat(request.getParameter("txtPreco")));    
        obj.setSinopse(request.getParameter("txtSinopse"));
        obj.setDatapublicacao(StormData.formata("dd/MM/yyyy"));
        obj.setEditora(e);
        obj.setCategoria(c);
        obj.setFoto1(request.getParameter("txtFoto1"));
        obj.setFoto2(request.getParameter("txtFoto2"));
        obj.setFoto3(request.getParameter("txtFoto3"));

        
//Autores
        List<Autor> listaautores = new ArrayList<>();
        for (String id : autoresid) {
            Integer idinteger = Integer.parseInt(id);
            listaautores.add(adao.buscarPorChavePrimaria(idinteger));
         }
        obj.setAutorList(listaautores);
        
        dao.incluir(obj);
        
        
    }
 
    List<Autor> autores = adao.listar();

          
       




%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Livraria Teste
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
            Livros
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="post" 
                  enctype="multipart/form-data">
             
                
                
                <div class="col-lg-6">
                      <div class="form-group">
                        <label>Autores</label>
                        <select name="autores" multiple>
                            <%for(Autor a:autores){%>
                            <option value="<%=a.getId()%>"><%=a.getNome()%>
                            </option>
                            <%}%>
                        </select>
                     </div>
                        
                        <div class="form-group">
                        <label>Autores com checkbox</label>
                       
                            <%for(Autor a:autores){%>
                            <input type="checkbox" name="autoreschk" value="<%=a.getId()%>"><%=a.getNome()%>
                           
                            <%}%>
                        </select>
                     </div>


                    <div class="form-group">
                        <label>Nome:</label>
                        <input class="form-control" type="text"  name="txtNome"  required />
                    </div>
                    
                    <div class="form-group">
                        <label>Preço:</label>
                        <input class="form-control" type="text"  name="txtPreco"  required />
                    </div>
                    
                    <div class="form-group">
                        <label>Sinopse:</label>
                        <textarea class="form-control" type="text"  name="txtSinopse"  required /></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label>Data Publicação:</label>
                        <input class="form-control" type="text"  name="txtDatapublicacao"  required />
                    </div>
                    
                    <div class="form-group">
                        <label>Editora:</label>
                        <input class="form-control" type="text"  name="txtEditora"  required />
                    </div>
                    
                    <div class="form-group">
                        <label>Categoria:</label>
                        <input class="form-control" type="text"  name="txtCategoria"  required />
                    </div>
                    
                    
                    <div class="form-group">
                        <label>Foto 1:</label>
                        <input type="file"  name="txtFoto1" required/>
                    </div>

                    <div class="form-group">
                        <label>Foto 2:</label>
                        <input type="file"  name="txtFoto2" required/>
                    </div>
                    
                    
                    <div class="form-group">
                        <label>Foto 3:</label>
                        <input type="file"  name="txtFoto3" required/>
                    </div>
                    
                    <button class="btn btn-warning btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>


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
            Categorias
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Autores</label>
                        <select name="autores" multiple>
                            <%for(Autor a:autores){%>
                            <option value="<%=a.getId()%>"><%=a.getNome()%>
                            </option>
                            <%}%>
                        </select>
                     </div>
                        
                        <div class="form-group">
                        <label>Autores com checkbox</label>
                       
                            <%for(Autor a:autores){%>
                            <input type="checkbox" name="autoreschk" value="<%=a.getId()%>"><%=a.getNome()%>
                           
                            <%}%>
                        </select>
                     </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>