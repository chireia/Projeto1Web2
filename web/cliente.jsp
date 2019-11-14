<%@page import="java.util.List"%>
<%@page import="entidades.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src='resources/js/bootstrap.min.js'></script>
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
    </head>
    <body>
        <h1>Formulário de Cliente:</h1>

        <%
            int id = 0;
            String nome = "";
            String telefone = "";
            String cpf = "";
            if (request.getAttribute("cliente") != null) {
                Cliente ed = (Cliente) request.getAttribute("cliente");
                id = ed.getId();
                nome = ed.getNome();
                telefone = ed.getTelefone();
                cpf = ed.getCpf();
            }

        %>        

        <div class="container">
            <form method="POST" action="cliente">
                <input name="id" type="hidden" value="<%= id%>"/>
                <div class="form-group">
                    <label id="labelNome" for="nome">Nome:</label>
                    <input id="nome" class="form-control" name="nome" type="text" required  value="<%= nome%>"/>
                </div>
                <div class="form-group">
                    <label id="labelNome" for="cpf">CPF:</label>
                    <input id="cpf" class="form-control" name="cpf" type="number" required value="<%= cpf%>"/>
                </div>
                <div class="form-group">
                    <label id="labelNome" for="telefone">Telefone:</label>
                    <input id="telefone" class="form-control" name="telefone" type="tel" required value="<%= telefone%>"/>
                </div>
                <button type="submit" class="btn btn-primary">Salvar</button>
            </form>
        </div>
        <div class="container">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Nome</th>
                        <th scope="col">CPF</th>
                        <th scope="col">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        List<Cliente> lista;
                        lista = (List<Cliente>) request.getAttribute("lista");
                    %>
                    <% for (Cliente c : lista) {%>
                    <tr>
                        <td><%= c.getNome()%></td>
                        <td><%= c.getCpf()%></td>
                        <td>
                            <a href="cliente?editar=<%= c.getId()%>">
                                <button class="btn btn-primary">Editar</button>
                            </a>
                            <a href="cliente?excluir=<%= c.getId()%>">
                                <button class="btn btn-danger">Excluir</button>
                            </a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
