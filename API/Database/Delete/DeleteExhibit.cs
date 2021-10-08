using GT_admin_API.Models;
using MySql.Data.MySqlClient;

namespace GT_admin_API.Database.Delete
{
    public class DeleteExhibit
    {
        public void Delete(int exID)
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            con.Open();
            string stm = "select SQLite_Version()";
            using var cmd = new MySqlCommand(stm,con);
            //Deletes the item from the database
            cmd.CommandText = @"DELETE FROM exhibit WHERE exid = @exID";
            cmd.Parameters.AddWithValue("@exID", exID);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
        }
    }
}