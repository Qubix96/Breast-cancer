/*select user from dual;*/

/*create table copy_number_somatic_mutation
(
icgc_donor_id varchar2(100),
project_code varchar2(100),
icgc_specimen_id varchar2(100),
icgc_sample_id varchar2(100),
matched_icgc_sample_id varchar2(100),
submitted_sample_id varchar2(100),
submitted_matched_sample_id varchar2(100),
mutation_type varchar2(100),
copy_number varchar2(100),
segment_mean varchar2(100),
segment_median varchar2(100),
chromosome varchar2(100),
chromosome_start varchar2(100),
chromosome_end varchar2(100),
assembly_version varchar2(100),
chromosome_start_range varchar2(100),
chromosome_end_range varchar2(100),
start_probe_id varchar2(100),
end_probe_id varchar2(100),
sequencing_strategy varchar2(100),
quality_score varchar2(100),
probability varchar2(100),
is_annotated varchar2(100),
veryfication_platform varchar2(100),
veryfication_status varchar2(100),
gene_affected varchar2(100),
transcript_affected varchar2(100),
gene_build_version varchar2(100),
platform varchar2(100),
experimental_protocol varchar2(100),
base_calling_algorithm varchar2(100),
alignment_algorithm varchar2(100),
variation_calling_algorithm varchar2(100),
other_analysis_algorithm varchar2(100),
seq_coverage varchar2(100),
raw_data_repository varchar2(100),
raw_data_accesion varchar2(100)
);

select * from copy_number_somatic_mutation;*/


/*drop table copy_number_somatic_mutation;*/

/*create table donor
(
icgc_donor_id VARCHAR2(100),
project_code VARCHAR2(100),
study_donor_involved_in VARCHAR2(100),
submitted_donor_id VARCHAR2(100),
donor_sex VARCHAR2(100),
donor_vital_status VARCHAR2(100),
disease_status_last_followup VARCHAR2(100),
donor_relapse_type VARCHAR2(100),
donor_age_at_diagnosis VARCHAR2(100),
donor_age_at_enrollment VARCHAR2(100),
donor_age_at_last_followup VARCHAR2(100),
donor_relapse_interval VARCHAR2(100),
donor_diagnosis_icd10 VARCHAR2(100),
donor_tumour_staging_system_at_diagnosis VARCHAR2(100),
donor_tumour_stage_at_diagnosis VARCHAR2(100),
donor_tumour_stage_at_diagnosis_supplemental VARCHAR2(100),
donor_survival_time VARCHAR2(100),
donor_interval_of_last_followup VARCHAR2(100),
prior_malignancy VARCHAR2(100),
cancer_type_prior_malignancy VARCHAR2(500),
cancer_history_first_dagree_relative VARCHAR2(100)
);

drop table donor;

select * from donor;*/

/*create table donor_exposure
(
icgc_donor_id VARCHAR2(100),
project_code VARCHAR2(100),
subbmited_donor_id VARCHAR2(100),
exposure_type VARCHAR2(100),
exposure_intensity VARCHAR2(100),
tabacco_smoking_history_indicator VARCHAR2(100),
tabacco_smoking_intensity VARCHAR2(100),
alcohol_history VARCHAR2(100),
alcohol_history_intensity VARCHAR2(100)
);

select * from donor;*/

/*create table donor_family
(
icgc_donor_id VARCHAR2(100),
project_code VARCHAR2(100),
subbmited_donor_id VARCHAR2(100),
donor_has_relative_with_cancer_history VARCHAR2(100),
relationship_type VARCHAR2(100),
relationship_type_other VARCHAR2(100),
relationship_sex VARCHAR2(100),
relationship_age VARCHAR2(100),
relationship_disase_icd10 VARCHAR2(100),
relationship_disease VARCHAR2(100)
);*/

/*create table donor_therapy
(
icgc_donor_id VARCHAR2(100),
project_code VARCHAR2(100),
subbmitted_donor_id VARCHAR2(100),
first_therapy_type VARCHAR2(100),
fisrt_therapy_therapeutic_intent VARCHAR2(100),
first_therapy_start_interval VARCHAR2(100),
first_therapy_duration VARCHAR2(100),
first_therapy_response VARCHAR2(100),
second_therapy_type VARCHAR2(100),
second_therapy_therapeutic_intent VARCHAR2(100),
second_therapy_start_interval VARCHAR2(100),
second_therapy_duration VARCHAR2(100),
second_therapy_response VARCHAR2(100),
other_therapy VARCHAR2(300),
other_therapy_response VARCHAR2(100)
);

select * from donor_therapy;*/

create table simple_somatic_mutation
(
icgc_mutation_id VARCHAR2(100),
icgc_donor_id VARCHAR2(100),
project_code VARCHAR2(100),
icgc_specimen_id VARCHAR2(100),
icgc_sample_id VARCHAR2(100),
matched_icgc_sample_id VARCHAR2(100),
submitted_specimen_id VARCHAR2(100),
submitted_matched_sample_id VARCHAR2(100),
chromosome VARCHAR2(100),
chromosome_start VARCHAR2(100),
chromosome_end VARCHAR2(100),
chromosome_strand VARCHAR2(100),
assembly_version VARCHAR2(100),
mutation_type VARCHAR2(100),
reference_genome_allele VARCHAR2(300),
mutated_from_allele VARCHAR2(300),
mutated_to_allele VARCHAR2(300),
quality_score VARCHAR2(100),
probability VARCHAR2(100),
total_read_count VARCHAR2(100),
mutant_allele_read_count VARCHAR2(100),
verification_status VARCHAR2(100),
verification_platform VARCHAR2(100),
biological_validation_status VARCHAR2(100),
biological_validation_platform VARCHAR2(100),
consequence_type VARCHAR2(100),
aa_mutation VARCHAR2(100),
cds_mutation VARCHAR2(100),
gene_affected VARCHAR2(100),
transcript_affected VARCHAR2(100),
gene_build_version VARCHAR2(300),
platform VARCHAR2(100),
experimental_protocol VARCHAR2(100),
sequencing_strategy VARCHAR2(100),
base_calling_algorithm VARCHAR2(100),
alignment_algorithm VARCHAR2(100),
variation_calling_algorithm VARCHAR2(100),
other_analysis_algorithm VARCHAR2(100),
seq_coverage VARCHAR2(100),
raw_data_repository VARCHAR2(100),
raw_data_accession VARCHAR2(100),
initial_data_release_data VARCHAR2(100)
);

drop table simple_somatic_mutation;