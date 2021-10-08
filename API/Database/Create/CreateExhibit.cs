using GT_admin_API.Models;
using MySql.Data.MySqlClient;

namespace GT_admin_API.Database.Create
{
    public class CreateExhibit
    {
         public void Create(Exhibit exhibit){
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            con.Open();
            string stm = "select SQLite_Version()";
            using var cmd = new MySqlCommand(stm,con);
            //Adds the item to the database
            cmd.CommandText = @"INSERT INTO category(exid,exname, medialink, description, expicturelink, mid, picturedescription) VALUES(@id, @name, @link, @description, @picture, @mid, @picdesc)";
            cmd.Parameters.AddWithValue("@id", exhibit.Id);
            cmd.Parameters.AddWithValue("@name", exhibit.Name);
            cmd.Parameters.AddWithValue("@link", exhibit.MediaLink);
            cmd.Parameters.AddWithValue("@description", exhibit.ExhibitDescription);
            cmd.Parameters.AddWithValue("@picture", exhibit.PictureLink);
            cmd.Parameters.AddWithValue("@mid", exhibit.MuseumId);
            cmd.Parameters.AddWithValue("@picdesc", exhibit.PhotoDescription);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
        }
    }
}