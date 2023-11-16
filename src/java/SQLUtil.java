
import java.sql.*;

public class SQLUtil {

    public static String getHtmlTable(ResultSet results)
            throws SQLException {

        StringBuilder htmlTable = new StringBuilder();
        ResultSetMetaData metaData = results.getMetaData();

        htmlTable.append("<table>");

        // add header row
        htmlTable.append("<tr>");

        htmlTable.append("<th>");
        htmlTable.append(metaData.getColumnName(2));
        htmlTable.append("</th>");

        htmlTable.append("<th>");
        htmlTable.append(metaData.getColumnName(3));
        htmlTable.append("</th>");

        htmlTable.append("<th>");
        htmlTable.append(metaData.getColumnName(4));
        htmlTable.append("</th>");

        htmlTable.append("</tr>");

        // add all other rows
        while (results.next()) {
            htmlTable.append("<tr>");

            htmlTable.append("<td> <img src=\"");
            htmlTable.append(results.getString(2));
            htmlTable.append("\" alt=\"Girl in a jacket\" width=\"150\" height=\"200\"></td>");

            htmlTable.append("<td>");
            htmlTable.append(results.getString(3));
            htmlTable.append("</td>");

            htmlTable.append("<td>$");
            htmlTable.append(results.getString(4));
            htmlTable.append("</td>");

            htmlTable.append("</tr>");
        }

        htmlTable.append("</table>");
        return htmlTable.toString();
    }
}
