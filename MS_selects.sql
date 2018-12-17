use MusicShop;

select b2.brand,
       s.model,
       c.model,
       c.wood,
       b.name,
       b.surname,
       (s.price + c.price) as sale,
       guitars_trade.date
from guitars_trade
       join guitars g on guitars_trade.guitar_id = g.id
       join strings s on g.string_id = s.id
       join buyers b on guitars_trade.buyer_id = b.id
       join corpora c on g.corpus_id = c.id
       join brands b2 on g.brand_id = b2.id;

select brands.brand, v.guitar_price
from brands
       join (
  select guitars.brand_id, avg(s.price + c.price) as guitar_price
  from guitars
         join corpora c on guitars.corpus_id = c.id
         join strings s on guitars.string_id = s.id
  group by guitars.brand_id
) v on brands.id = v.brand_id;

select brands.brand, v.s
from brands
       join (
  select g2.brand_id, sum(sale) as s
  from (
         select guitar_id, (s.price + c.price) as sale, date
         from guitars_trade
                join guitars g on guitars_trade.guitar_id = g.id
                join strings s on g.string_id = s.id
                join corpora c on g.corpus_id = c.id
         where date > '2018-10-01'
           and date < '2018-11-01'
       ) as trades
         join guitars g2 on guitar_id = g2.id
  group by g2.brand_id
) v on brands.id = v.brand_id;
