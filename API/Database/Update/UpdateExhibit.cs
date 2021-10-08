using GT_admin_API.Models;
using MySql.Data.MySqlClient;

namespace GT_admin_API.Database.Update
{
    public class UpdateExhibit
    {
          public void Update(Exhibit exhibit)
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            con.Open();
            string stm = "select MySQL_Version()";
            using var cmd = new MySqlCommand(stm,con);
            //Updates the item condition and availability in the database

            cmd.CommandText = @"UPDATE exhibit SET exname = @name, medialink = @link, description = @ex_description, picturedescription = @picdesc, expicturelink = @picture, mid = @mid WHERE exid = @id";
            cmd.Parameters.AddWithValue("@id", exhibit.Id);
            cmd.Parameters.AddWithValue("@name", exhibit.Name);
            cmd.Parameters.AddWithValue("@link", exhibit.MediaLink);
            cmd.Parameters.AddWithValue("@picdesc", exhibit.PhotoDescription);
            cmd.Parameters.AddWithValue("@description", exhibit.ExhibitDescription);
            cmd.Parameters.AddWithValue("@picture", exhibit.PictureLink);
            cmd.Parameters.AddWithValue("@mid", exhibit.MuseumId);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
        }
    }
}