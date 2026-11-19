using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaWebsite.Data.Entities.Cinema;

public class Halls
{
    public long Id { get; set; }

    public long CinemaId { get; set; }

    public string Name { get; set; } = null!;

    public Cinemas Cinema { get; set; } = null!;
}
