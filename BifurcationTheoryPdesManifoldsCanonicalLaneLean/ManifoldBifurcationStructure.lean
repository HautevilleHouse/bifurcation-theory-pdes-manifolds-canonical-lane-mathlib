import BifurcationTheoryPdesManifoldsCanonicalLaneLean.AdmissibleClass
import Mathlib.Geometry.Manifold.Basic

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure ParameterManifold where
  carrier : Type
  topology : TopologicalSpace carrier
  smoothStructure : ContDiffManifold 𝓘(ℝ, carrier) carrier

structure BifurcationLocus (A : AdmissibleClass) where
  parameterSpace : ParameterManifold
  bifurcationSet : Set parameterSpace.carrier
  codimension : ℕ
  transversalityCondition : Prop
  structuralStability : Prop
  bifurcationSetComputed : Prop
  transversalityConditionTerm : transversalityCondition
  structuralStabilityTerm : structuralStability
  bifurcationSetComputedTerm : bifurcationSetComputed

structure ManifoldBifurcationEvidence (A : AdmissibleClass)
    (L : BifurcationLocus A) where
  transversalityConditionClosed : L.transversalityCondition
  structuralStabilityClosed : L.structuralStability
  bifurcationSetComputedClosed : L.bifurcationSetComputed

def ManifoldBifurcationClosed (A : AdmissibleClass)
    (L : BifurcationLocus A) : Prop :=
  L.transversalityCondition ∧ L.structuralStability ∧ L.bifurcationSetComputed

theorem manifold_bifurcation_closed_from_evidence (A : AdmissibleClass)
    (L : BifurcationLocus A) (E : ManifoldBifurcationEvidence A L) :
    ManifoldBifurcationClosed A L := by
  exact And.intro E.transversalityConditionClosed
    (And.intro E.structuralStabilityClosed E.bifurcationSetComputedClosed)

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse