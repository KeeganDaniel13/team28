using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.DAL
{
    interface IDatabaseOperator<T>
    {
        IEnumerable<T> getTable();
        T getRecord(int id);
        IEnumerable<T> addRecord(T item);
        IEnumerable<T> deleteRecord(int id);
        T updateRecord(int id,T item);
<<<<<<< HEAD
        bool exists(int id);
        
=======
        bool exists(int id); 
>>>>>>> newService
    }
}
