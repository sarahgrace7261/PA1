namespace GT_admin_API.Models
{
    public class Exhibit
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string ExhibitDescription { get; set; }
        public int MuseumId { get; set; }
        public string MediaLink { get; set; }
        public string PictureLink { get; set; }
        public string PhotoDescription { get; set; }
    }
}