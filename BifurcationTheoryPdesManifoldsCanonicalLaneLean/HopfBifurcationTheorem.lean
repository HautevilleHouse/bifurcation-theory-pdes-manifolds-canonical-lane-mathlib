import BifurcationTheoryPdesManifoldsCanonicalLaneLean.BifurcationPDEAnalysis
import BifurcationTheoryPdesManifoldsCanonicalLaneLean.ManifoldBifurcationStructure

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure HopfBifurcationPackage (A : AdmissibleClass) where
  parameterFamily : (ℝ → A.object.space.carrier → ℝ) → Prop
  equilibriumFamily : (ℝ → A.object.space.carrier) → Prop
  linearizedEigenvalues : A.object.pdeParameterSpace → ℂ
  eigenvalueCrossingSpeed : ℝ
  periodicOrbitBranch : Prop
  periodicOrbitExists : Prop
  periodicOrbitBranchTerm : periodicOrbitBranch
  periodicOrbitExistsTerm : periodicOrbitExists

structure HopfBifurcationEvidence (A : AdmissibleClass)
    (H : HopfBifurcationPackage A) where
  periodicOrbitBranchClosed : H.periodicOrbitBranch
  periodicOrbitExistsClosed : H.periodicOrbitExists

def HopfBifurcationClosed (A : AdmissibleClass)
    (H : HopfBifurcationPackage A) : Prop :=
  H.periodicOrbitBranch ∧ H.periodicOrbitExists

theorem hopf_bifurcation_closed_from_evidence (A : AdmissibleClass)
    (H : HopfBifurcationPackage A) (E : HopfBifurcationEvidence A H) :
    HopfBifurcationClosed A H := by
  exact And.intro E.periodicOrbitBranchClosed E.periodicOrbitExistsClosed

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse