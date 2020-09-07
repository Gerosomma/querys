
select count(v.id_vale) as cantidad_vales_vigentes, p.id_persona
from vales v  inner join lineas_credito lc on lc.id_linea_credito = v.id_linea_credito
inner join pdv on pdv.id_pdv = lc.id_pdv
inner join comercios c on c.id_comercio = pdv.id_comercio
inner join personas p on p.id_persona = c.id_titular
where v.fecha_vencimiento_vale >= DATE_FORMAT(curdate(), '%Y%m%d') and
	p.id_persona = 812;
	


select v.*, p.id_persona
from vales v  inner join lineas_credito lc on lc.id_linea_credito = v.id_linea_credito
inner join vales_anulados va on v.id_vale = va.id_vale
inner join pdv on pdv.id_pdv = lc.id_pdv
inner join comercios c on c.id_comercio = pdv.id_comercio
inner join personas p on p.id_persona = c.id_titular;



select COUNT(cuo.id_cuota) as cantidad_cuotas_pagas_vale_vigente
from vales v  inner join lineas_credito lc on lc.id_linea_credito = v.id_linea_credito
inner join pdv on pdv.id_pdv = lc.id_pdv
inner join comercios c on c.id_comercio = pdv.id_comercio
inner join personas p on p.id_persona = c.id_titular
inner join cuotas cuo on v.id_vale = cuo.id_vale
where p.id_persona = 142 and cuo.saldo_cuota_vale < 1 and v.fecha_vencimiento_vale > DATE_FORMAT(curdate(), '%Y%m%d');

