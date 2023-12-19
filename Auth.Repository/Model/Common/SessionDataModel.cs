namespace Auth.Repository.Model.Common
{
    public class SessionDataModel
    {
        public string MsgCode { get; set; }
        public string Msg { get; set; }
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string Token { get; set; }
        public dynamic ResponseData { get; set; }

    }
}
