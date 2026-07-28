import BifurcationTheoryPdesManifoldsCanonicalLaneLean.CenterManifold

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure BifurcationEndpointPackage {P : BifurcationPDEPackage}
    {L : LyapunovSchmidtReductionPackage P} {C : CenterManifoldPackage L} where
  bifurcationType : Prop
  stabilityChange : Prop
  branchEquivalence : Prop

structure BifurcationEndpointEvidence {P : BifurcationPDEPackage}
    {L : LyapunovSchmidtReductionPackage P} {C : CenterManifoldPackage L}
    (E : BifurcationEndpointPackage) where
  bifurcationTypeClosed : E.bifurcationType
  stabilityChangeClosed : E.stabilityChange
  branchEquivalenceClosed : E.branchEquivalence

def BifurcationEndpointClosed {P : BifurcationPDEPackage}
    {L : LyapunovSchmidtReductionPackage P} {C : CenterManifoldPackage L}
    (E : BifurcationEndpointPackage) : Prop :=
  E.bifurcationType ∧ E.stabilityChange ∧ E.branchEquivalence

theorem bifurcation_endpoint_closed_from_evidence {P : BifurcationPDEPackage}
    {L : LyapunovSchmidtReductionPackage P} {C : CenterManifoldPackage L}
    (Ep : BifurcationEndpointPackage) (Ev : BifurcationEndpointEvidence Ep) :
    BifurcationEndpointClosed Ep := by
  exact And.intro Ev.bifurcationTypeClosed
    (And.intro Ev.stabilityChangeClosed Ev.branchEquivalenceClosed)

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse