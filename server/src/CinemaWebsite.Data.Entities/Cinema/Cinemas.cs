using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace CinemaWebsite.Data.Entities.Cinema;

public class Cinemas
{
    public long Id { get; set; }

    public string Name { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string? Phone { get; set; }

    public string? Email { get; set; }

    public string? WorkingHours { get; set; }

    public ICollection<Halls> Halls { get; set; } = new List<Halls>();
}
