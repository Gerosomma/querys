
-- Cantidad Vales Vigentes ---

select count(v.id_vale) as cantidad_vales_vigentes
from vales v  inner join lineas_credito lc on lc.id_linea_credito = v.id_linea_credito
inner join pdv on pdv.id_pdv = lc.id_pdv
inner join comercios c on c.id_comercio = pdv.id_comercio
inner join personas p on p.id_persona = c.id_titular
where p.id_persona = 812
and (v.fecha_vencimiento_vale >= DATE_FORMAT(curdate(), '%Y%m%d') or v.saldo_vale > 1);
	

-- Cantidad Vales Cancelados --

select count(v.id_vale) as cantidad_vales_anulados
from vales v  inner join lineas_credito lc on lc.id_linea_credito = v.id_linea_credito
inner join vales_anulados va on v.id_vale = va.id_vale
inner join pdv on pdv.id_pdv = lc.id_pdv
inner join comercios c on c.id_comercio = pdv.id_comercio
inner join personas p on p.id_persona = c.id_titular
where p.id_persona = 812;


select count(v.id_vale) as cantidad_vales_cancelados 
from vales v  inner join lineas_credito lc on lc.id_linea_credito = v.id_linea_credito
inner join pdv on pdv.id_pdv = lc.id_pdv
inner join comercios c on c.id_comercio = pdv.id_comercio
inner join personas p on p.id_persona = c.id_titular
where p.id_persona = 812
and (v.fecha_vencimiento_vale >= DATE_FORMAT(curdate(), '%Y%m%d') or v.saldo_vale < 1);


-- Cantidad Vales --

SELECT count(v.id_vale) as cantidad_vales_total
from vales v  inner join lineas_credito lc on lc.id_linea_credito = v.id_linea_credito
inner join pdv on pdv.id_pdv = lc.id_pdv
inner join comercios c on c.id_comercio = pdv.id_comercio
inner join personas p on p.id_persona = c.id_titular
where p.id_persona = 812;


-- Cantidad Cuotas Devengadas Vale Vigente --

select COUNT(cuo.id_cuota) as cantidad_cuotas_pagas_vale_vigente
from vales v  inner join lineas_credito lc on lc.id_linea_credito = v.id_linea_credito
inner join pdv on pdv.id_pdv = lc.id_pdv
inner join comercios c on c.id_comercio = pdv.id_comercio
inner join personas p on p.id_persona = c.id_titular
inner join cuotas cuo on v.id_vale = cuo.id_vale
where p.id_persona = 142 and cuo.saldo_cuota_vale < 1 and v.fecha_vencimiento_vale > DATE_FORMAT(curdate(), '%Y%m%d');

