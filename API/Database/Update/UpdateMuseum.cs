using GT_admin_API.Models;
using MySql.Data.MySqlClient;

namespace GT_admin_API.Database.Update
{
    public class UpdateMuseum
    {
         public void Update(Museum museum)
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            con.Open();
            string stm = "select MySQL_Version()";
            using var cmd = new MySqlCommand(stm,con);
            //Updates the item condition and availability in the database

            cmd.CommandText = @"UPDATE museum SET mname = @name, mpicturelink = @link, picturedescription = @picdesc WHERE mid = @id";
            cmd.Parameters.AddWithValue("@id", museum.Id);
            cmd.Parameters.AddWithValue("@name", museum.MuseumName);
            cmd.Parameters.AddWithValue("@link", museum.PictureLink);
            cmd.Parameters.AddWithValue("@picdesc", exhibit.PhotoDescription);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
        }
    }
}