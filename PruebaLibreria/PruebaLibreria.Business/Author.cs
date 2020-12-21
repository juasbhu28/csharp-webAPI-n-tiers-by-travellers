using PruebaLibreria.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PruebaLibreria.Business
{
    public class Author
    {
        public static List<Entities.AuthorsView> GetAuthors()
        {
            using (Data.LibraryEntitiesContext _context = new Data.LibraryEntitiesContext())
            {              
                return _context.AuthorsView.ToList();
            }
        }

        public static List<Entities.AuthorsByEditorialView> GetAuthorsByEditorial(int editorialId)
        {
            using (Data.LibraryEntitiesContext _context = new Data.LibraryEntitiesContext())
            {            
                return _context.AuthorsByEditorialView
                    .Where(x => x.EditorialId == editorialId ).ToList();
            }
        }
    }
}
