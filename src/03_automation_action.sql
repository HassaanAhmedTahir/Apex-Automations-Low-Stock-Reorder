BEGIN
  INSERT INTO prc_reorder_requests
    (rreq_prod_fk, rreq_stock_at_request, rreq_reorder_level, rreq_order_qty)
  VALUES
    (:PROD_ID, :PROD_STOCK_QTY, :PROD_REORDER_LEVEL, :ORDER_QTY);

  apex_automation.log_info(
    'Reorder request created for ' || :PROD_SKU ||
    ' - stock '    || :PROD_STOCK_QTY ||
    ', level '     || :PROD_REORDER_LEVEL ||
    ', ordering '  || :ORDER_QTY);
END;
