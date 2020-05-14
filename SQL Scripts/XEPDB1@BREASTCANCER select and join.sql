


select d.icgc_donor_id, d.donor_sex, d.donor_vital_status, d.donor_age_at_diagnosis, d.donor_tumour_stage_at_diagnosis from donor d;

select e.icgc_donor_id, e.alcohol_history, e.tabacco_smoking_history_indicator from donor_exposure e;

select f.icgc_donor_id, f.donor_has_relative_with_cancer_history, f.relationship_type, f.relationship_type_other, f.relationship_sex, f.relationship_age, f.relationship_disease  from donor_family f;

select 
d.icgc_donor_id, 
d.donor_sex, 
d.donor_vital_status, 
d.donor_age_at_diagnosis, 
d.donor_tumour_stage_at_diagnosis,
e.alcohol_history, 
e.tabacco_smoking_history_indicator,
f.donor_has_relative_with_cancer_history, 
f.relationship_type, 
f.relationship_type_other, 
f.relationship_sex, 
f.relationship_age, 
f.relationship_disease
from donor d
inner join 
donor_exposure e
on e.icgc_donor_id = d.icgc_donor_id
inner join
donor_family f
on f.icgc_donor_id = d.icgc_donor_id;




select snp.icgc_mutation_id, snp.icgc_donor_id, snp.chromosome, snp.chromosome_start, snp.chromosome_end, snp.reference_genome_allele, snp.mutated_to_allele, snp.verification_status from simple_somatic_mutation snp;

select m.icgc_donor_id, m.mutation_type, m.chromosome, m.chromosome_start, m.chromosome_end  from copy_number_somatic_mutation m;
