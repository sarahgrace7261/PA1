using System.Collections.Generic;
using GT_admin_API.Models;
using MySql.Data.MySqlClient;

namespace GT_admin_API.Database.Read
{
    public class ReadExhibit
    {
        public List<Exhibit> GetAll()
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            con.Open();
            //gets all items sorted by name
            string stm = "SELECT * FROM exhibit";
            using var cmd = new MySqlCommand(stm,con);
            using MySqlDataReader rdr = cmd.ExecuteReader();
            List<Exhibit> myItems = new List<Exhibit>();
            while(rdr.Read())
            {
                //creates the list from the database
                myItems.Add(new Exhibit(){Id = rdr.GetInt32(0), Name = rdr.GetString(1), MediaLink = rdr.GetString(2), ExhibitDescription = rdr.GetString(3), PictureLink = rdr.GetString(4), MuseumId = rdr.GetInt32(5), PhotoDescription = rdr.GetString(6)});    
            }

    
            return myItems;
        }

        public Exhibit GetOne(int exID)
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            //Gets a specific item
            con.Open();
            string stm = "SELECT * FROM exhibit WHERE exid = @exID";
            using var cmd = new MySqlCommand(stm, con);
            cmd.Parameters.AddWithValue("@exID", exID);
            cmd.Prepare();
            using MySqlDataReader rdr = cmd.ExecuteReader();

            rdr.Read();
            return new Exhibit(){Id = rdr.GetInt32(0), Name = rdr.GetString(1), MediaLink = rdr.GetString(2), ExhibitDescription = rdr.GetString(3), PictureLink = rdr.GetString(4), MuseumId = rdr.GetInt32(5), PhotoDescription = rdr.GetString(6)};
            
        }
    }
}