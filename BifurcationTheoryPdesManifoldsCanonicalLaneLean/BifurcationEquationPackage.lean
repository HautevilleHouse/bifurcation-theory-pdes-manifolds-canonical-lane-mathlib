import BifurcationTheoryPdesManifoldsCanonicalLaneLean.LyapunovSchmidtReduction

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure BifurcationEquationPackage {A : AdmissibleClass} {L : LinearizationPackage A} {C : CenterManifoldPackage L} {R : LyapunovSchmidtReductionPackage C} where
  equation : (A.object.manifoldType → ℝ) → (A.object.manifoldType → ℝ)
  bifurcationPointParameter : A.object.parameterSpace
  solutionBranch : Prop
  stabilityAnalysis : Prop

structure BifurcationEquationEvidence {A : AdmissibleClass} {L : LinearizationPackage A} {C : CenterManifoldPackage L} {R : LyapunovSchmidtReductionPackage C} (B : BifurcationEquationPackage R) where
  solutionBranchClosed : B.solutionBranch
  stabilityAnalysisClosed : B.stabilityAnalysis

def BifurcationEquationClosed {A : AdmissibleClass} {L : LinearizationPackage A} {C : CenterManifoldPackage L} {R : LyapunovSchmidtReductionPackage C} (B : BifurcationEquationPackage R) : Prop :=
  B.solutionBranch ∧ B.stabilityAnalysis

theorem bifurcation_equation_closed_from_evidence {A : AdmissibleClass} {L : LinearizationPackage A} {C : CenterManifoldPackage L} {R : LyapunovSchmidtReductionPackage C} (B : BifurcationEquationPackage R) (E : BifurcationEquationEvidence B) : BifurcationEquationClosed B := by
  exact And.intro E.solutionBranchClosed E.stabilityAnalysisClosed

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse