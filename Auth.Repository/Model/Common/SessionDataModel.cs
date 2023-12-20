namespace Auth.Repository.Model.Common
{
    public class SessionDataModel
    {
        public string MsgCode { get; set; }
        public string Msg { get; set; }
        public int UserID { get; set; } = 0;
        public string UserName { get; set; } = "N/A";
        public string Token { get; set; } = "N/A";
        public dynamic ResponseData { get; set; } = "N/A";

    }
}
