#!/usr/bin/perl
use strict;
use warnings;

# Prompt user to enter the ligand file
print "Enter the ligand file containing the list of PDBQT ligands:\t";
my $ligfile = <STDIN>;
chomp $ligfile;

# Open the ligand file and read the contents
open(my $fh, '<', $ligfile) or die "Cannot open file: $ligfile\n";
my @arr_file = <$fh>;
close($fh);

# Loop over each ligand file listed in the input file
for my $ligand (@arr_file) {
    chomp $ligand;  # Remove newlines
    print "Processing ligand: $ligand\n";
    
    # Extract the base name of the ligand (without extension)
    my ($name) = $ligand =~ /^(.+)\.pdbqt$/;
    
    # Run Vina 1.2.5 command for the current ligand
    my $logfile = "${name}_log.txt";  # Log file for stdout and stderr
    my $outfile = "${name}_out.pdbqt";  # Output file for the docking result
    
    my $command = "vina --config conf.txt --ligand $ligand --out $outfile > $logfile 2>&1";
    print "Running command: $command\n";
    system($command) == 0 
        or warn "Failed to run Vina for $ligand. See log file: $logfile\n";
}

print "Docking complete for all ligands.\n";