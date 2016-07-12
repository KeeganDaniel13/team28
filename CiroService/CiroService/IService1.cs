using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using CiroService.EFDatabase;
<<<<<<< HEAD
=======
using CiroService.JsonObjects;
using System.Web.Http;
>>>>>>> 8f6445e3901c44fb9322d5e00765e85cffa47959

namespace CiroService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {

        [OperationContract]
<<<<<<< HEAD
        string GetData(int value);

        [OperationContract]
        string login(string user, string password);

        [OperationContract]
        IEnumerable<product> listProduct();

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);
=======
        [WebGet(UriTemplate="data",BodyStyle =WebMessageBodyStyle.Wrapped,ResponseFormat =WebMessageFormat.Json)]
        string GetData();

        [OperationContract]
        [WebGet(BodyStyle =WebMessageBodyStyle.Wrapped,RequestFormat = WebMessageFormat.Json,ResponseFormat =WebMessageFormat.Json,UriTemplate ="login/{name}/{password}")]
        string login(string name,string password);  

        [OperationContract]
        [WebGet(BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "products/{id}")]
        string clientProducts(string id);

        [OperationContract]
        [WebGet(BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "register/{fname}/{sname}/{email}/{password}")]
        string register(string fname, string sname, string email, string password);

       // [OperationContract]
       // [WebGet(UriTemplate ="/listProducts", BodyStyle = WebMessageBodyStyle.Bare, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
       // IEnumerable<product> listProduct();

        //[OperationContract]
       // CompositeType GetDataUsingDataContract(CompositeType composite);
>>>>>>> 8f6445e3901c44fb9322d5e00765e85cffa47959

        // TODO: Add your service operations here
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
