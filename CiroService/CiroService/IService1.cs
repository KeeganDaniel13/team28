using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using CiroService.EFDatabase;

using CiroService.JsonObjects;
using System.Web.Http;

namespace CiroService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {

        [WebGet(UriTemplate="data",BodyStyle =WebMessageBodyStyle.Wrapped,ResponseFormat =WebMessageFormat.Json)]
        string GetData();

        [OperationContract]
        [WebInvoke(Method="POST",BodyStyle =WebMessageBodyStyle.Wrapped,RequestFormat = WebMessageFormat.Json,ResponseFormat =WebMessageFormat.Json,UriTemplate ="login")]
        string login(jsonLoginUser login);  

        [OperationContract]
        [WebGet(BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "products/{id}")]
        string clientProducts(string id);

        [OperationContract]
        [WebInvoke(Method="POST",BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "register")]
        string register(RegisterUser regUser);

       // [OperationContract]
       // [WebGet(UriTemplate ="/listProducts", BodyStyle = WebMessageBodyStyle.Bare, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
       // IEnumerable<product> listProduct();

        //[OperationContract]
       // CompositeType GetDataUsingDataContract(CompositeType composite);

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
