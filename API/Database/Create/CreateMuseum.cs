using GT_admin_API.Models;
using MySql.Data.MySqlClient;

namespace GT_admin_API.Database.Create
{
    public class CreateMuseum
    {
        public void Create(Museum museum)
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            con.Open();
            string stm = "select SQLite_Version()";
            using var cmd = new MySqlCommand(stm, con);
            //Adds the item to the database
            cmd.CommandText = @"INSERT INTO museum(mid, mname, mpicturelink, picturedescription) VALUES(@id, @name, @link, @picdesc)";
            cmd.Parameters.AddWithValue("@id", museum.Id);
            cmd.Parameters.AddWithValue("@name", museum.MuseumName);
            cmd.Parameters.AddWithValue("@link", museum.PictureLink);
            cmd.Parameters.AddWithValue("@picdesc", exhibit.PhotoDescription);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
        }
    }
}