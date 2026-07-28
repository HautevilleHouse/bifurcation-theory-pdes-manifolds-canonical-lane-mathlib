import HautevilleHouse.BifurcationTheoryPdesManifoldsCanonicalLaneLean.BifurcationParameter

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure BifurcationAnalysisPackage {M : BifurcationManifoldPackage}
    {F : BifurcationPDEPackage M} (P : BifurcationParameterPackage F) where
  blowupSequence : Prop
  generalizedEigenspace : Prop
  centerManifoldReduction : Prop
  bifurcationBranch : Prop

structure BifurcationAnalysisEvidence {M : BifurcationManifoldPackage}
    {F : BifurcationPDEPackage M} {P : BifurcationParameterPackage F}
    (A : BifurcationAnalysisPackage P) where
  blowupSequenceClosed : A.blowupSequence
  generalizedEigenspaceClosed : A.generalizedEigenspace
  centerManifoldReductionClosed : A.centerManifoldReduction
  bifurcationBranchClosed : A.bifurcationBranch

def BifurcationAnalysisClosed {M : BifurcationManifoldPackage}
    {F : BifurcationPDEPackage M} {P : BifurcationParameterPackage F}
    (A : BifurcationAnalysisPackage P) : Prop :=
  A.blowupSequence ∧ A.generalizedEigenspace ∧ A.centerManifoldReduction ∧ A.bifurcationBranch

theorem bifurcation_analysis_closed_from_evidence {M : BifurcationManifoldPackage}
    {F : BifurcationPDEPackage M} {P : BifurcationParameterPackage F}
    (A : BifurcationAnalysisPackage P) (E : BifurcationAnalysisEvidence A) :
    BifurcationAnalysisClosed A := by
  exact And.intro E.blowupSequenceClosed
    (And.intro E.generalizedEigenspaceClosed
      (And.intro E.centerManifoldReductionClosed E.bifurcationBranchClosed))

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse
