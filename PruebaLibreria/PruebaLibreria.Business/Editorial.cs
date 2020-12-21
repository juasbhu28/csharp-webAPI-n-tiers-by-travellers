using PruebaLibreria.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PruebaLibreria.Business
{
    public class Editorial
    {
        public static Entities.Editorial PostEditorial(Entities.Editorial editorial)
        {
            using (Data.LibraryEntitiesContext _context = new Data.LibraryEntitiesContext())
            {
                Entities.Editorial result = _context.Editorials.Add(editorial);
                _context.SaveChanges();

                return result;
            }
        }

        public static List<Entities.Editorial> GetEditorials()
        {
            using (Data.LibraryEntitiesContext _context = new Data.LibraryEntitiesContext())
            {
                return _context.Editorials.ToList();
            }
        }

    }
}
