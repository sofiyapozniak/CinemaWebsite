using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaWebsite.Data.Entities.Seat;

public class SeatTypes
{
    public long Id { get; set; }

    public string Name { get; set; } = null!;

    public decimal PriceCoefficient { get; set; }
}