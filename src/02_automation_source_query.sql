SELECT p.prod_id,
       p.prod_sku,
       p.prod_name,
       p.prod_stock_qty,
       p.prod_reorder_level,
       (p.prod_reorder_level * 3) - p.prod_stock_qty AS order_qty
FROM   prc_products p
WHERE  p.prod_status = 'ACTIVE'
AND    p.prod_stock_qty <= p.prod_reorder_level
AND    NOT EXISTS (SELECT 1
                   FROM   prc_reorder_requests r
                   WHERE  r.rreq_prod_fk = p.prod_id
                   AND    r.rreq_status IN ('OPEN','ORDERED'))
ORDER  BY p.prod_sku;
