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
using System.IO;


namespace CiroService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {

        [WebGet(UriTemplate = "users", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        IEnumerable <JsonUser> GetUsers();
		
        [WebGet(UriTemplate = "data", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        string GetData();

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "login")]
        JsonUser login(jsonLoginUser login);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "clientProducts")]
        IEnumerable<jsonProduct> clientProducts(JsonUser user);

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "listRequests")]
        IEnumerable<TransferDetails> listTransferTRequests();

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "transferrequest")]
        string transeferRequest(jsonTRequest newRequest);

        //Complete
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "transferlist")]
        IEnumerable<TransferDetails> transferList();

        //Complete
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "stocktake")]
        string stockTake(stockTakeInfo stockTake);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "stockadd")]
        void stockAdd(string origin, IEnumerable<jsonProduct> newProduct/*, JsonWarehouse _warehouse*/);

        //TaskList Warehouse Manager
        //To complete
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "tasks/{id}")]
        IEnumerable<jsonTask> taskList(string id);

        //Report incident
        //Todo
        //accept 
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addincident")]
        void addIncident(jsonIncident newIncident);

        //return warehouse information
        //todo
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "warehouseInfo/{id}")]
        JsonWarehouse warehouseInfo(string id);

        //return list of warehouses
        //todo
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "warehouseInfo")]
        IEnumerable<JsonWarehouse> warehouses();


        //Now 
        //Stock take
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "stockleaving/{location}")]
        IEnumerable<transferStock> stockleavingWarehouse(string location);
        //Still needed and implementation
        //Notification
        //messages
        //Pendingtansfer
        //warehouse condition
        //warehouse transaction history

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "register")]
        string register(JsonUser regUser);

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "updateUser/{id}")]
        string updateUser(string id, JsonUser updateUsr);

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageID/{id}")]
        JsonProducts getPackageID(string id);

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageType/{type}")]
        IEnumerable<JsonProducts> getPackageType(string type);

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageOwner/{id}")]
        IEnumerable<JsonProducts> getPackageOwner(string id);

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageDate/{date}")]
        string getPackageDate(string date);

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageDest/{dest}")]
        string getPackageDest(string dest);

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageLocation/{location}")]
        string getPackageLocation(string location);

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addPackage")]
        string addPackage(JsonProducts prod);

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "updatePackage/{id}")]
        string updatePackage(string id, JsonProducts prod);

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "updatePackageWLocation/{id}")]
        string updatePackageWLocation(string id, string location);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "releaseRequest/{description}")]
        string releaseRequest(JsonUser owner, jsonProduct product, string description);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getRelease")]
        IEnumerable<JsonReleaseRequest> getRelease(JsonUser user);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getReleaseRequests")]
        IEnumerable<JsonReleaseRequest> getReleaseRequests();

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addProductLog/{code}")]
        string addProductLog(string code, JsonProductLog productlog, JsonProducts prod);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getProductLog")]
        IEnumerable<JsonProductLog> getProductLog(jsonProduct product);

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getWarehouse")]
        IEnumerable<JsonWarehouse> getWarehouse();

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "approveTransfer")]
        string approveTransfer(jsonProduct product, string verdict);

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "approveRequest")]
        string approveRequest(string verdict, JsonProducts prod);

        [OperationContract]
        void paypal();

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "OwnershipRequest")]
        string OwnershipRequest(JsonUser currentOwner, JsonUser newOwner, JsonProducts prod);

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "approveOwnershipRequest/{verdict}")]
        string approveOwnershipRequest(string verdict,JsonUser user, JsonProducts prod);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getOwnershipRequest")]
        IEnumerable<JsonOwnershipReq> getOwnershipRequest(JsonUser user);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getTraderInStock")]
        IEnumerable<JsonUser> getTraderInStock(JsonWarehouse warehouses);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addWarehouse")]
        void addWarehouse(JsonWarehouse warehouse);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addCountry")]
        void addCountry(JsonCountry country);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getWarehouseInventory")]
        IEnumerable<JsonInventory> getWarehouseInventory(JsonWarehouse warehouses);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addWarehouseMan")]
        string addWarehouseMan(JsonUser user);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getWarehouseI")]
        JsonWarehouse getWarehouseI(JsonWarehouse warehouses);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getUser")]
        JsonUser getUser(JsonUser users);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getBill")]
        IEnumerable<JsonBillofEntry> getBill(JsonBillofEntry bill);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addInvoice")]
        string addInvoice(JsonBillofEntry bill, JsonProducts product);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getInvoice")]
        JsonInvoice getInvoice(JsonInvoice invoiceNum, jsonProduct products);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addTax")]
        string addTax(JsonProducts products, JsonBillofEntry newBill);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getMessages")]
        IEnumerable<JsonMessage> getMessage(JsonUser users);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getUserOwnershipRequest")]
        IEnumerable<JsonOwnershipReq> getUserOwnershipRequest(JsonUser user);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "sendMessage")]
        string sendMessage(JsonMessage messages);

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "payTax")]
        string payTax(JsonInvoice invoices);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "findavailablelocation")]
        jsonlocation findavailablelocation(JsonWarehouse w, jsonProduct p);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "findlocation")]
        string findlocation(JsonWarehouse w, jsonProduct p);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addlocation")]
        string addlocation(jsonlocation loca);

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageInWarehouse/{packageID}")]
        jsonlocation getPackageInWarehouse(string packageID);

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "occupylocation/{id}")]
        void occupylocation(jsonlocation loc, string id);

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "vacatelocation/{packageID}")]
        void vacatelocation(string packageID);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getWarehouseLocations/{warehousesID}")]
        IEnumerable<jsonlocation> getWarehouseLocations(string warehousesID);





        //REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS 
        //================================================ ================================================ ================================================ ================================================ ================================================ 
        //double bar graph - occupied space vs total space
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "WarehouseAvailability")]
        IEnumerable<jsonWarehouseAvailabilty> WarehouseAvailabilityGraph();

        //pie chart for the three size categories for length
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "PackageLengthCategories")]
        IEnumerable<PackageSizeCategory> PackageLengthCategories();

        //pie chart for the three size categories for height
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "PackageHeightCategories")]
        IEnumerable<PackageSizeCategory> PackageHeightCategories();

        //pie chart for the three size categories for width
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "PackagewidthCategories")]
        IEnumerable<PackageSizeCategory> PackagewidthCategories();

        //Number of incidents per warehouse
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "WarehouseIncidents")]
        IEnumerable<WarehouseIncidentsGraph> WarehouseIncidents();

        //Most common release destination
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "WarehouseReleases")]
        IEnumerable<WarehouseReleasescs> WarehouseReleases();

        //Packages Received Per Month For Warehouse
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "PackagesPerMonth")]
        IEnumerable<PackagePerMonth> PackagesPerMonth(JsonWarehouse warehouse);

        //REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS 
        //================================================ ================================================ ================================================ ================================================ ================================================ 



















        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "itemsNeedRelease")]
        IEnumerable<ReleaseProduct> releaseWareHouse(JsonWarehouse warehouse);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "itemsNeedTransfer")]
        IEnumerable<JsonProducts> transferWareHouse(JsonWarehouse warehouse);




        /* [OperationContract]
         [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageNotification")]
         string getPackageNotification(JsonUser user);*/



        // [OperationContract]
        // [WebGet(UriTemplate ="/listProducts", BodyStyle = WebMessageBodyStyle.Bare, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        // IEnumerable<product> listProduct();

        //[OperationContract]
        // CompositeType GetDataUsingDataContract(CompositeType composite);
    }
}
