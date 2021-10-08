namespace GT_admin_API.Models
{
    public class ConnectionString
    {
        public string cs {get; set;}
    
        public ConnectionString()
        {
            string server = "qao3ibsa7hhgecbv.cbetxkdyhwsb.us-east-1.rds.amazonaws.com";
            string database = "rl77a6k2od2gd67l";
            string port = "3306";
            string userName = "	ffs38tbe7r6ndh8y";
            string password = "oz9w8vddnfb8g054";

            cs = $@"server = {server};user = {userName};database = {database};port = {port};password = {password};";
        }
    }
}