/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifcriodosul.lp2.exservlet.servlet;

import br.edu.ifcriodosul.lp2.exservlet.conceitual.HistoriaEmQuadrinhos;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JDBCHqsServlet extends HttpServlet {

    private Connection con;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //conectar no banco
        con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost/lp2_hqs",
                    "root",
                    "");
            String acao = "listar";
            String destino = "hq_list.jsp";

            //testa se existe a acao
            if (request.getParameter("acao") != null) {
                acao = request.getParameter("acao");
            }
            if (acao.equalsIgnoreCase("listar")) {
                destino = listar(request, response);
            } else if (acao.equalsIgnoreCase("inserir")) {
                destino = inserir(request, response);
                destino = listar(request, response);
            } else if (acao.equalsIgnoreCase("alterar")) {
                destino = alterar(request, response);
                destino = listar(request, response);
            } else if (acao.equalsIgnoreCase("remover")) {
                destino = remover(request, response);
                destino = listar(request, response);
            } else if (acao.equalsIgnoreCase("selecionar")) {
                destino = selecionar(request, response);
            }
            request.getRequestDispatcher(destino)
                    .forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected String listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String saida = "";
        //rodar comando sql (consulta)
        Statement stm = con.createStatement();
        //carregar o resultset (conjunto de dados de resulta)
        ResultSet rs = stm.executeQuery("SELECT * FROM tb_hqs");
        //colocar em um escopo
        List<HistoriaEmQuadrinhos> hqs = new ArrayList<HistoriaEmQuadrinhos>();
        while (rs.next()) {
            HistoriaEmQuadrinhos hs = new HistoriaEmQuadrinhos();
            hs.setId(rs.getInt("id"));
            hs.setTitulo(rs.getString("titulo"));
            hs.setPaginas(rs.getInt("paginas"));
            hqs.add(hs);
        }
        //repassar para pagina (com Dispatcher)
        request.setAttribute("hqs", hqs);
        saida = "hq_list.jsp";

        return saida;

    }

    protected String selecionar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String saida = "";
        String id = request.getParameter("id");
        //rodar comando sql (consulta)
        Statement stm = con.createStatement();
        //carregar o resultset (conjunto de dados de resulta)
        ResultSet rs = stm.executeQuery(
                "SELECT * FROM tb_hqs WHERE id=" + id);
        //colocar em um escopo
        HistoriaEmQuadrinhos hs = null;
        if (rs.next()) {
            hs = new HistoriaEmQuadrinhos();
            hs.setId(rs.getInt("id"));
            hs.setTitulo(rs.getString("titulo"));
            hs.setPaginas(rs.getInt("paginas"));
        }
        //repassar para pagina (com Dispatcher)
        request.setAttribute("hqs", hs);
        saida = "hq_form.jsp";
        return saida;

    }

    protected String inserir(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String saida = "hq_form.jsp";
        //criar objeto
        HistoriaEmQuadrinhos hs = new HistoriaEmQuadrinhos();
        //preencher objeto
        
        hs.setTitulo(request.getParameter("titulo"));
        hs.setPaginas(Integer.parseInt(request.getParameter("paginas")));
        
        //colocar objeto no banco
        PreparedStatement pstm = con.prepareStatement(
                "INSERT INTO tb_hqs "
                + "(titulo, paginas)"
                + " VALUES (?,?)");
        pstm.setString(1, hs.getTitulo());
        pstm.setInt(2, hs.getPaginas());
        //
        pstm.executeUpdate();

        return saida;

    }

    protected String alterar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String saida = "hq_form.jsp";
        //criar objeto
        HistoriaEmQuadrinhos hs = new HistoriaEmQuadrinhos();
        //preencher objeto
        hs.setId(Integer.parseInt(request.getParameter("id")));//id a mais        
        hs.setTitulo(request.getParameter("titulo"));
        hs.setPaginas(Integer.parseInt(request.getParameter("paginas")));
        //colocar objeto no banco
        PreparedStatement pstm = con.prepareStatement(
                "UPDATE tb_hqs SET "
                + "titulo=?, paginas=?"
                + "WHERE id=?");
        pstm.setString(1, hs.getTitulo());
        pstm.setInt(2, hs.getPaginas());
        pstm.setInt(3, hs.getId());
        //
        pstm.executeUpdate();
        return saida;

    }

    protected String remover(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String saida = "hq_list.jsp";
        //pegar id
        String id = request.getParameter("id");
        //rodar delete
        PreparedStatement pstm = con.prepareStatement(
                "DELETE FROM tb_hqs WHERE id=?");
        pstm.setInt(1, Integer.parseInt(id));
        pstm.executeUpdate();

        return saida;

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
