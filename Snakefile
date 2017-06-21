
rule hisat_index:
    input:
        infile = config["fasta_genome"]
    output:
        outfile = config["index_prefix"] + ".1.ht2"
    params:
        outfile = config["index_prefix"]
    conda:
        "../../envs/global.yaml"
    threads:
        24
    shell:
        "hisat2-build -p {threads} {input.infile} {params.outfile}"

rule download_genome:
    output:
        config["fasta_genome"]
    shell:
        "curl {config[genome_url]} | gunzip > {output[0]}"
